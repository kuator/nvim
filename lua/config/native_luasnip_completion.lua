local M = {}

local function docstring_lines(snip)
  local ok, docstring = pcall(snip.get_docstring, snip)
  if not ok or docstring == nil then
    return {}
  end
  if type(docstring) == "string" then
    return vim.split(docstring, "\n", { plain = true })
  end
  if type(docstring) == "table" then
    return docstring
  end
  return { tostring(docstring) }
end

local function documentation(snip, filetype)
  local description = type(snip.dscr) == "table"
      and table.concat(snip.dscr, "\n")
    or (snip.dscr or "")
  local lines = {
    (snip.name or snip.trigger) .. " _ `[" .. filetype .. "]`",
    "---",
    description,
    "```" .. vim.bo.filetype,
  }
  vim.list_extend(lines, docstring_lines(snip))
  lines[#lines + 1] = "```"

  return {
    kind = vim.lsp.protocol.MarkupKind.Markdown,
    value = table.concat(lines, "\n"),
  }
end

local function member_context(before_word)
  return before_word:match("[%.:]%s*$") ~= nil
end

local function insertion_for_trigger(trigger, before_word)
  local punctuation = trigger:match("^([^A-Za-z0-9_]+)")
  if punctuation and vim.endswith(before_word, punctuation) then
    return trigger:sub(#punctuation + 1)
  end
  return trigger
end

local function is_postfix(snip, candidate_line)
  local ok, expand_params = pcall(snip.matches, snip, candidate_line)
  return ok
    and type(expand_params) == "table"
    and vim.tbl_get(expand_params, "env_override", "POSTFIX_MATCH") ~= nil
end

function M.source()
  local helpers = require("null-ls.helpers")
  local completion = require("null-ls.methods").internal.COMPLETION

  return helpers.make_builtin({
    name = "luasnip",
    method = completion,
    filetypes = {},
    generator = {
      async = true,
      fn = function(params, done)
        local luasnip = require("luasnip")
        local filetypes = require("luasnip.util.util").get_snippet_filetypes()
        local line = params.content[params.row] or ""
        local line_to_cursor = line:sub(1, params.col)
        local word = params.word_to_complete or ""
        local before_word = line_to_cursor:sub(1, #line_to_cursor - #word)
        local after_member = member_context(before_word)
        local items = {}

        for _, filetype in ipairs(filetypes) do
          for index, snip in pairs(luasnip.get_snippets(filetype) or {}) do
            if not snip.hidden and snip.show_condition(line_to_cursor) then
              local insertion = insertion_for_trigger(snip.trigger, before_word)
              local candidate_line = before_word .. insertion
              local postfix = is_postfix(snip, candidate_line)
              local valid_context = (after_member and postfix)
                or (not after_member and not postfix)

              if valid_context and vim.startswith(insertion, word) then
                items[#items + 1] = {
                  label = snip.trigger,
                  filterText = insertion,
                  insertText = insertion,
                  kind = vim.lsp.protocol.CompletionItemKind.Snippet,
                  sortText = snip.trigger,
                  documentation = documentation(snip, filetype),
                  data = {
                    type = "luasnip",
                    filetype = filetype,
                    ft_indx = index,
                    snip_id = snip.id,
                    postfix = postfix,
                  },
                }
              end
            end
          end
        end

        done({
          {
            items = items,
            isIncomplete = true,
          },
        })
      end,
    },
  })
end

return M
