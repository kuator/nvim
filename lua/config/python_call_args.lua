local M = {}

local callable_kinds = {
  [vim.lsp.protocol.CompletionItemKind.Class] = true,
  [vim.lsp.protocol.CompletionItemKind.Constructor] = true,
}

local function parameter_label(signature, param)
  if type(param.label) == "string" then
    return param.label
  end

  if type(param.label) ~= "table"
    or type(param.label[1]) ~= "number"
    or type(param.label[2]) ~= "number"
    or type(signature.label) ~= "string"
  then
    return nil
  end

  -- LSP parameter-label ranges are zero-based UTF-16 offsets into the
  -- signature label. `ty` uses this form instead of returning the text.
  local ok_start, start_byte = pcall(
    vim.str_byteindex,
    signature.label,
    "utf-16",
    param.label[1],
    false
  )
  local ok_end, end_byte = pcall(
    vim.str_byteindex,
    signature.label,
    "utf-16",
    param.label[2],
    false
  )

  if not ok_start or not ok_end then
    return nil
  end

  return signature.label:sub(start_byte + 1, end_byte)
end

local function find_empty_call()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  -- Blink may leave the cursor here:
  --
  -- hello|()
  --
  -- In insert mode, col is a 0-based byte index.
  local after = line:sub(col + 1)

  if after:sub(1, 2) == "()" then
    return {
      row = row,
      open_col = col,
    }
  end

  -- Or here:
  --
  -- hello(|)
  if line:sub(col, col) == "("
    and line:sub(col + 1, col + 1) == ")"
  then
    return {
      row = row,
      open_col = col - 1,
    }
  end

  -- Or occasionally here:
  --
  -- hello()|
  if col >= 2 and line:sub(col - 1, col) == "()" then
    return {
      row = row,
      open_col = col - 2,
    }
  end

  return nil
end

local function add_empty_call()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  -- Insert-mode cursors may sit after the completed word, while other modes
  -- clamp onto its final character. Advance over any remaining identifier.
  while line:sub(col + 1, col + 1):match("[%w_]") do
    col = col + 1
  end

  vim.api.nvim_buf_set_text(
    0,
    row - 1,
    col,
    row - 1,
    col,
    { "()" }
  )
  vim.api.nvim_win_set_cursor(0, { row, col + 1 })

  return {
    row = row,
    open_col = col,
  }
end

local function parse_required_params(signature)
  local params = {}

  for _, param in ipairs(signature.parameters or {}) do
    local raw_label = parameter_label(signature, param)

    if raw_label then
      local label = vim.trim(raw_label)

      local name = label:match("^([%a_][%w_]*)")

      if name
        and name ~= "self"
        and name ~= "cls"
        and not label:match("^%*")
        and not label:find("=", 1, true)
      then
        params[#params + 1] = name
      end
    end
  end

  return params
end

local function request_signature(state)
  if state.done
    or vim.api.nvim_get_current_buf() ~= state.bufnr
    or vim.api.nvim_get_current_win() ~= state.winid
  then
    return
  end

  local cursor = vim.api.nvim_win_get_cursor(state.winid)
  local line = vim.api.nvim_get_current_line()

  if cursor[1] ~= state.call.row
    or (cursor[2] ~= state.call.open_col and cursor[2] ~= state.call.open_col + 1)
    or line ~= state.line
  then
    state.done = true
    return
  end

  state.client:request(
    "textDocument/signatureHelp",
    state.params,
    function(err, result)
      if state.done
        or err
        or not result
        or not result.signatures
        or #result.signatures == 0
      then
        return
      end

      vim.schedule(function()
        if state.done
          or vim.api.nvim_get_current_buf() ~= state.bufnr
          or vim.api.nvim_get_current_win() ~= state.winid
        then
          return
        end

        local sig =
          result.signatures[(result.activeSignature or 0) + 1]
          or result.signatures[1]

        local required = parse_required_params(sig)

        if #required == 0 then
          return
        end

        local parts = {}

        for i, name in ipairs(required) do
          parts[#parts + 1] = ("${%d:%s}"):format(i, name)
        end

        local snippet =
          table.concat(parts, ", ") .. ")$0"

        local cursor = vim.api.nvim_win_get_cursor(state.winid)
        local line = vim.api.nvim_get_current_line()
        local insert_col = state.call.open_col + 1

        if cursor[1] ~= state.call.row
          or (cursor[2] ~= state.call.open_col and cursor[2] ~= insert_col)
          or line ~= state.line
        then
          state.done = true
          return
        end

        state.done = true

        -- Remove Blink's closing ")".
        vim.api.nvim_set_current_line(
          line:sub(1, insert_col) .. line:sub(insert_col + 2)
        )

        local function expand_snippet()
          require("luasnip").lsp_expand(snippet, {
            pos = { state.call.row - 1, insert_col },
          })
        end

        local cmp = require("blink.cmp")

        if cmp.is_visible() then
          cmp.hide({ callback = expand_snippet })
        else
          expand_snippet()
        end
      end)
    end,
    state.bufnr
  )
end

local function expand_call_args(call)
  local bufnr = vim.api.nvim_get_current_buf()
  local winid = vim.api.nvim_get_current_win()
  local clients = vim.lsp.get_clients({
    bufnr = bufnr,
    method = "textDocument/signatureHelp",
  })
  local client = clients[1]

  if not client then
    return
  end

  -- Signature help is only reliable with the cursor inside the call.
  vim.api.nvim_win_set_cursor(winid, {
    call.row,
    call.open_col + 1,
  })

  local state = {
    bufnr = bufnr,
    winid = winid,
    call = call,
    line = vim.api.nvim_get_current_line(),
    client = client,
    params = vim.lsp.util.make_position_params(
      winid,
      client.offset_encoding
    ),
    done = false,
  }

  -- Schedule attempts independently: a stale signature request may not answer
  -- promptly, and must not prevent later requests from reaching the server.
  -- `state.done` makes the first successful response win.
  for _, delay in ipairs({ 0, 25, 50, 100 }) do
    vim.defer_fn(function()
      request_signature(state)
    end, delay)
  end
end

function M.accept(cmp)
  local item = cmp.get_selected_item()

  if not item then
    return
  end

  local add_brackets = callable_kinds[item.kind] == true

  return cmp.accept({
    callback = function()
      vim.schedule(function()
        if vim.bo.filetype ~= "python" then
          return
        end

        local call = find_empty_call()

        if not call and add_brackets then
          call = add_empty_call()
        end

        if not call then
          vim.notify(
            "python_call_args: couldn't find () after completion"
          )
          return
        end

        expand_call_args(call)
      end)
    end,
  })
end

return M
