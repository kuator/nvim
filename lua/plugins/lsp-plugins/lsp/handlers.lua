local M = {}

local function lsp_keymaps(client, bufnr)
  -- Keybindings for LSPs
  vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>ge", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "<leader>gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<a-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  -- https://github.com/MurdeRM3L0DY/dotfiles/blob/b756d26a39351366ab30086440e1fbe8655efc39/roles/nvim/files/lua/plugins/null-ls/config.lua
  if client.supports_method 'textDocument/formatting' then
    vim.keymap.set('n', '<leader>F', function()
      vim.lsp.buf.format({
        filter = function(client) return client.name ~= "tsserver" end,
        bufnr = bufnr,
      })
    end,
      { buffer = bufnr })
  end

  -- if client.supports_method 'textDocument/rangeFormatting' then
  -- vim.keymap.set("v", "<leader>F", function()
  --   vim.lsp.buf.range_formatting()
  -- end)
  -- end

end

M.on_attach = function(client, bufnr)
  lsp_keymaps(client, bufnr)

  local status_ok, lspkind = pcall(require, "lspkind")
  if status_ok then
    lspkind.init({
      -- DEPRECATED (use mode instead): enables text annotations
      --
      -- default: true
      -- with_text = true,

      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',

      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    }
    )
  end

  local status_ok, aerial = pcall(require, "aerial")
  if status_ok then
    aerial.on_attach(client, bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = capabilities

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
