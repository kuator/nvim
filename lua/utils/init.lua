local M = {}

local function on_attach(client, bufnr)
  -- Keybindings for LSPs
  local options = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, options)
  vim.keymap.set("n", "<leader>ge", vim.lsp.buf.declaration, options)
  vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, options)
  vim.keymap.set("n", "<space>gf", function()
    vim.lsp.buf.format({ async = false })
  end, options)
  vim.keymap.set("v", "<space>gf", function()
    vim.lsp.buf.format({ async = false })
  end, options)
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, options)
  -- vim.keymap.set("n", "<leader>gk",  vim.lsp.buf.signature_help, options)
  vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, options)
  vim.keymap.set("n", "<leader>gy", vim.lsp.buf.type_definition, options)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, options)
  vim.keymap.set("n", "<leader>gt", vim.lsp.buf.document_symbol, options)
  vim.keymap.set("n", "<leader>gw", vim.lsp.buf.workspace_symbol, options)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
  vim.keymap.set("n", "<a-.>", vim.lsp.buf.code_action, options)

  -- vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  -- https://github.com/MurdeRM3L0DY/dotfiles/blob/b756d26a39351366ab30086440e1fbe8655efc39/roles/nvim/files/lua/plugins/null-ls/config.lua

  local function format_servers(server)
    local servers_to_ignore = { "ruff", "tsserver", "lua_ls", "jdtls" }

    if servers_to_ignore[server] then
      return false
    else
      return true
    end
  end

  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<leader>F", function()
      vim.lsp.buf.format({
        filter = function(client_)
          return format_servers(client_.name)
        end,
        bufnr = bufnr,
        timeout_ms = 2000,
      })
    end, { buffer = bufnr })
  end

  -- if client.supports_method 'textDocument/rangeFormatting' then
  -- vim.keymap.set("v", "<leader>F", function()
  --   vim.lsp.buf.range_formatting()
  -- end)
  -- end
end

local function get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end
  return capabilities
end

local function has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

M.on_attach = function(client, bufnr)
  on_attach(client, bufnr)
end

M.capabilities = get_capabilities()

M.has_value = has_value

return M
