require("mason").setup()

vim.lsp.config("ty", {
  flags = {
    debounce_text_changes = 25,
  },
})

require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = {
    -- "basedpyright",
    "ty",
    "vimls",
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
