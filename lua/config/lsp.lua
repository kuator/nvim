require("mason").setup()

vim.lsp.config("ty", {
  flags = {
    debounce_text_changes = 25,
  },
})

require("mason-lspconfig").setup({
  -- Metals v2 and JDTLS must not attach to the same Java buffer. Keep JDTLS
  -- as the default; NVIM_METALS_JAVA=1 switches Java to Metals in the
  -- isolated native-completion profile.
  automatic_enable = vim.env.NVIM_METALS_JAVA == "1"
      and { exclude = { "jdtls" } }
    or true,
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
    "tsc",
    "yamlls",
    "jsonls",
    "emmet_language_server",
    "cssls",
    -- "css_variables", "cssmodules-language-server", "ty",
  },
})

vim.lsp.config('shuck', {})
vim.lsp.enable('shuck')
