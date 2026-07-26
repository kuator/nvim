vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mfussenegger/nvim-jdtls",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/b0o/SchemaStore.nvim",
}, { load = true, confirm = false })

require("mason").setup()

require("mason-lspconfig").setup({
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
