local M = {}

local kind_names = {
  [1] = "Text",
  [2] = "Method",
  [3] = "Function",
  [4] = "Constructor",
  [5] = "Field",
  [6] = "Variable",
  [7] = "Class",
  [8] = "Interface",
  [9] = "Module",
  [10] = "Property",
  [11] = "Unit",
  [12] = "Value",
  [13] = "Enum",
  [14] = "Keyword",
  [15] = "Snippet",
  [16] = "Color",
  [17] = "File",
  [18] = "Reference",
  [19] = "Folder",
  [20] = "EnumMember",
  [21] = "Constant",
  [22] = "Struct",
  [23] = "Event",
  [24] = "Operator",
  [25] = "TypeParameter",
}

local kind_highlights = {
  Text = "String",
  Method = "Function",
  Function = "Function",
  Constructor = "Type",
  Field = "Identifier",
  Variable = "Identifier",
  Class = "Type",
  Interface = "Type",
  Module = "Include",
  Property = "Identifier",
  Unit = "Number",
  Value = "Constant",
  Enum = "Type",
  Keyword = "Keyword",
  Snippet = "Special",
  Color = "Number",
  File = "Directory",
  Reference = "Identifier",
  Folder = "Directory",
  EnumMember = "Constant",
  Constant = "Constant",
  Struct = "Type",
  Event = "Special",
  Operator = "Operator",
  TypeParameter = "Type",
}

local ignored_buftypes = {
  nofile = true,
  prompt = true,
  quickfix = true,
  terminal = true,
}

local ignored_filetypes = {
  DressingInput = true,
  TelescopePrompt = true,
  checkhealth = true,
  lazy = true,
  mason = true,
  notify = true,
}

local callable_kinds = {
  [vim.lsp.protocol.CompletionItemKind.Function] = true,
  [vim.lsp.protocol.CompletionItemKind.Method] = true,
  [vim.lsp.protocol.CompletionItemKind.Class] = true,
  [vim.lsp.protocol.CompletionItemKind.Constructor] = true,
}

local function lsp_completion_item(completed_item)
  return vim.tbl_get(
    completed_item,
    "user_data",
    "nvim",
    "lsp",
    "completion_item"
  )
end

local function configure_buffer(buf)
  if not vim.api.nvim_buf_is_valid(buf) then
    return
  end

  local ignored = ignored_buftypes[vim.bo[buf].buftype]
    or ignored_filetypes[vim.bo[buf].filetype]

  if ignored then
    vim.api.nvim_set_option_value("autocomplete", false, { buf = buf })
    vim.b[buf].native_completion_disabled = true
  elseif vim.b[buf].native_completion_disabled then
    vim.api.nvim_set_option_value("autocomplete", true, { buf = buf })
    vim.b[buf].native_completion_disabled = nil
  end
end

local function primary_language_client()
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if client.name ~= "null-ls"
      and client.name ~= "filepaths_ls"
      and client.name ~= "skkelua"
      and client:supports_method("textDocument/completion")
    then
      return client
    end
  end
end

local function item_source(item)
  if vim.tbl_get(item, "data", "type") == "luasnip" then
    return "LuaSnip"
  end
  if vim.tbl_get(item, "data", "skkelua") then
    return "SKK"
  end
  if item.kind == vim.lsp.protocol.CompletionItemKind.File
    or item.kind == vim.lsp.protocol.CompletionItemKind.Folder
  then
    return "Path"
  end
  return "LSP"
end

local function insertion_text(item)
  if type(item.textEdit) == "table" then
    return item.textEdit.newText
  end
  return item.insertText
end

local function inserts_call(item)
  if not callable_kinds[item.kind] then
    return false
  end

  -- The Python CompleteDone handler adds () for every callable kind and then
  -- replaces the empty call with required-argument placeholders when known.
  if vim.bo.filetype == "python" then
    return true
  end

  local text = insertion_text(item)
  return type(text) == "string" and text:find("(", 1, true) ~= nil
end

local function mark_callable(label, item)
  if not inserts_call(item) then
    return label
  end

  local start_col, end_col = label:find(item.label, 1, true)
  if end_col then
    return label:sub(1, end_col) .. "~" .. label:sub(end_col + 1)
  end
  return label .. "~"
end

local function raw_lsp_item(item)
  return vim.tbl_get(item, "user_data", "nvim", "lsp", "completion_item")
    or item
end

local prefix_cache = {}

local function current_prefix()
  local buf = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local changedtick = vim.b[buf].changedtick
  local cached = prefix_cache[buf]

  if cached
    and cached.changedtick == changedtick
    and cached.row == cursor[1]
    and cached.col == cursor[2]
  then
    return cached.prefix
  end

  local line = vim.api.nvim_get_current_line():sub(1, cursor[2])
  local prefix = line:match("[A-Za-z0-9_]+$") or ""
  prefix_cache[buf] = {
    changedtick = changedtick,
    col = cursor[2],
    prefix = prefix,
    row = cursor[1],
  }
  return prefix
end

local function case_rank(item)
  local prefix = current_prefix()
  if prefix == "" then
    return 2
  end

  local value = item.filterText or item.label or ""
  if vim.startswith(value, prefix) then
    return 0
  end
  if vim.startswith(value:lower(), prefix:lower()) then
    return 1
  end
  return 2
end

local function completion_item_comparator(a, b)
  local raw_a = raw_lsp_item(a)
  local raw_b = raw_lsp_item(b)
  local a_skkelua = vim.tbl_get(raw_a, "data", "skkelua") == true
  local b_skkelua = vim.tbl_get(raw_b, "data", "skkelua") == true

  if a_skkelua ~= b_skkelua then
    return a_skkelua
  end

  if a_skkelua then
    return (raw_a.sortText or raw_a.label or "")
      < (raw_b.sortText or raw_b.label or "")
  end

  local a_luasnip = vim.tbl_get(raw_a, "data", "type") == "luasnip"
  local b_luasnip = vim.tbl_get(raw_b, "data", "type") == "luasnip"
  local a_postfix = a_luasnip and vim.tbl_get(raw_a, "data", "postfix") == true
  local b_postfix = b_luasnip and vim.tbl_get(raw_b, "data", "postfix") == true

  -- Keep postfix snippets discoverable after member-access punctuation, but
  -- do not let their punctuation-prefixed labels outrank real members before
  -- any part of the postfix trigger has been typed.
  if current_prefix() == "" and a_postfix ~= b_postfix then
    return not a_postfix
  end

  local case_a = a._native_case_rank or 2
  local case_b = b._native_case_rank or 2
  if case_a ~= case_b then
    return case_a < case_b
  end

  local score_a = a._fuzzy_score or -math.huge
  local score_b = b._fuzzy_score or -math.huge
  if score_a ~= score_b then
    return score_a > score_b
  end

  if a_luasnip ~= b_luasnip then
    return a_luasnip
  end

  local sort_a = raw_a.sortText or raw_a.label or a.abbr or a.word or ""
  local sort_b = raw_b.sortText or raw_b.label or b.abbr or b.word or ""
  if sort_a ~= sort_b then
    return sort_a < sort_b
  end

  return (raw_a.label or a.abbr or "") < (raw_b.label or b.abbr or "")
end

local function completion_item_converter()
  local colorful = require("colorful-menu")
  local lspkind = require("lspkind")

  return function(item)
    local name = kind_names[item.kind] or "Text"
    local label = vim.tbl_get(item, "data", "display") or item.label
    local highlighted
    local client = primary_language_client()
    if client and item_source(item) == "LSP" then
      local ok, result = pcall(colorful.native_completion_highlight, item, client)
      if ok then
        highlighted = result
      end
    end

    label = mark_callable((highlighted and highlighted.label) or label, item)

    return {
      abbr = " " .. label .. " ",
      abbr_hlgroup = highlighted and highlighted.highlights or nil,
      kind = " " .. lspkind.symbolic(name) .. " ",
      kind_hlgroup = "NativeCompletionKind" .. name,
      menu = " [" .. item_source(item) .. "] ",
      _native_case_rank = case_rank(item),
    }
  end
end

local configuring_buffers = {}

local function configure_lsp_completion(buf)
  if configuring_buffers[buf] then
    return
  end
  configuring_buffers[buf] = true

  vim.schedule(function()
    configuring_buffers[buf] = nil
    if not vim.api.nvim_buf_is_valid(buf) then
      return
    end

    local clients = vim.lsp.get_clients({
      bufnr = buf,
      method = "textDocument/completion",
    })
    if #clients == 0 then
      return
    end

    -- Completion options are buffer-wide in Neovim even though enable() takes
    -- a client ID. Rebuild the handle so whichever client attached first
    -- cannot silently choose different conversion or sorting behavior.
    for _, client in ipairs(clients) do
      vim.lsp.completion.enable(false, client.id, buf)
    end
    for _, client in ipairs(clients) do
      vim.lsp.completion.enable(true, client.id, buf, {
        autotrigger = true,
        cmp = completion_item_comparator,
        convert = completion_item_converter(),
      })
    end
  end)
end

local function apply_highlights()
  vim.api.nvim_set_hl(0, "Pmenu", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "PmenuBorder", { link = "FloatBorder" })
  vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
  vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Comment" })
  vim.api.nvim_set_hl(0, "PmenuExtraSel", { link = "Comment" })
  vim.api.nvim_set_hl(0, "PmenuMatch", { bold = true })
  vim.api.nvim_set_hl(0, "PmenuMatchSel", { bold = true })
  vim.api.nvim_set_hl(0, "NativeCompletionDocumentation", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "NativeCompletionDocumentationBorder", { link = "FloatBorder" })

  for name, target in pairs(kind_highlights) do
    vim.api.nvim_set_hl(0, "NativeCompletionKind" .. name, { link = target })
  end
end

local function style_documentation_window()
  local info = vim.fn.complete_info({ "selected" })
  local win = info.preview_winid
  local buf = info.preview_bufnr
  if not win
    or win == 0
    or not vim.api.nvim_win_is_valid(win)
    or not buf
    or buf == 0
    or not vim.api.nvim_buf_is_valid(buf)
  then
    return
  end

  local config = vim.api.nvim_win_get_config(win)
  if config.relative ~= "" then
    pcall(vim.api.nvim_win_set_config, win, {
      border = "rounded",
      title = " Documentation ",
      title_pos = "center",
    })
  end

  local width = math.min(vim.api.nvim_win_get_width(win), 72)
  local height = math.min(vim.api.nvim_win_text_height(win).all, vim.o.previewheight)
  pcall(vim.api.nvim_win_set_width, win, math.max(width, 1))
  pcall(vim.api.nvim_win_set_height, win, math.max(height, 1))

  vim.wo[win].wrap = true
  vim.wo[win].linebreak = true
  vim.wo[win].breakindent = true
  vim.wo[win].conceallevel = 2
  vim.wo[win].cursorline = false
  vim.wo[win].foldcolumn = "0"
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].signcolumn = "no"
  vim.wo[win].winblend = 0
  vim.wo[win].winhighlight = table.concat({
    "Normal:NativeCompletionDocumentation",
    "NormalFloat:NativeCompletionDocumentation",
    "EndOfBuffer:NativeCompletionDocumentation",
    "FloatBorder:NativeCompletionDocumentationBorder",
  }, ",")
end

local function schedule_documentation_style()
  vim.schedule(style_documentation_window)
  -- completionItem/resolve may update and resize the same float asynchronously.
  vim.defer_fn(style_documentation_window, 120)
end

local function expand_luasnip_item(item)
  if vim.tbl_get(item, "data", "type") ~= "luasnip" then
    return
  end

  vim.schedule(function()
    local ok, luasnip = pcall(require, "luasnip")
    if ok and luasnip.expandable() then
      luasnip.expand()
    end
  end)
end

function M.setup()
  require("colorful-menu").setup()
  require("config.native_buffer_completion").setup()

  vim.opt.autocomplete = true
  -- LSP candidates come first. The custom completefunc provides cached,
  -- structured buffer words without exposing the unstyled builtin source.
  vim.opt.complete = { "o", "F" }
  -- Keep server-provided ordering (important for SKK dictionary ranks) while
  -- allowing fuzzy filtering of the visible candidates.
  vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy", "nosort" }
  vim.opt.completeitemalign = { "kind", "abbr", "menu" }
  vim.opt.pumborder = "rounded"
  vim.opt.pumheight = 12
  vim.opt.pumwidth = 32
  vim.opt.pummaxwidth = 0

  local highlight_group =
    vim.api.nvim_create_augroup("native-completion-highlights", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = highlight_group,
    callback = apply_highlights,
  })
  apply_highlights()

  local buffer_group =
    vim.api.nvim_create_augroup("native-completion-buffer-policy", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    group = buffer_group,
    callback = function(ev)
      configure_buffer(ev.buf)
    end,
  })
  vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
    group = buffer_group,
    callback = function(ev)
      prefix_cache[ev.buf] = nil
    end,
  })
  configure_buffer(vim.api.nvim_get_current_buf())

  -- Entering Insert mode should not complete text that was already under the
  -- cursor. Re-enable automatic completion when the user actually types.
  vim.api.nvim_create_autocmd("InsertEnter", {
    group = buffer_group,
    callback = function(ev)
      if not vim.b[ev.buf].native_completion_disabled then
        vim.api.nvim_set_option_value("autocomplete", false, { buf = ev.buf })
      end
    end,
  })
  vim.api.nvim_create_autocmd("InsertCharPre", {
    group = buffer_group,
    callback = function(ev)
      if not vim.b[ev.buf].native_completion_disabled then
        vim.api.nvim_set_option_value("autocomplete", true, { buf = ev.buf })
      end
    end,
  })

  vim.api.nvim_create_autocmd("CompleteChanged", {
    group = vim.api.nvim_create_augroup("native-completion-documentation", { clear = true }),
    callback = schedule_documentation_style,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("native-lsp-completion", { clear = true }),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client
        or not client:supports_method("textDocument/completion")
      then
        return
      end

      configure_lsp_completion(ev.buf)
    end,
  })

  vim.api.nvim_create_autocmd("CompleteDone", {
    group = vim.api.nvim_create_augroup("native-completion-done", { clear = true }),
    callback = function()
      local item = lsp_completion_item(vim.v.completed_item)
      if not item then
        return
      end

      expand_luasnip_item(item)

      if vim.bo.filetype == "python" then
        require("config.python_call_args").on_complete_done(item)
      end
    end,
  })
end

return M
