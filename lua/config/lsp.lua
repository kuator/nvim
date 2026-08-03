require("mason").setup()

require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = {
    -- "basedpyright",
    "ty",
    "zk",
    -- "pyrefly",
    "ruff",
    "emmylua_ls",
    "postgres_lsp",
    "jdtls",
    "tsgo",
    "yamlls",
    "jsonls",
    "emmet_language_server",
    "cssls",
    -- "css_variables", "cssmodules-language-server", "ty",
  },
})

vim.lsp.config('shuck', {})
vim.lsp.enable('shuck')
