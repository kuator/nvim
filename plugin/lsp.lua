vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/yioneko/nvim-vtsls",
  "https://github.com/mfussenegger/nvim-jdtls",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/jay-babu/mason-null-ls.nvim",
  "https://github.com/nvimtools/none-ls-extras.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvimtools/none-ls.nvim",
  "https://github.com/b0o/SchemaStore.nvim",
}, { load = true, confirm = false })

local function configure_lsp()
  require("mason").setup()
  require("mason-lspconfig").setup({
    automatic_enable = {
      exclude = {
        -- "jdtls", "vtsls", "vue_ls", "vtsls",
      },
    },
    ensure_installed = {
      -- "basedpyright",
      "ty",
      -- "pyrefly",
      "ruff",
      "emmylua_ls",
      "postgres_lsp",
      "jdtls",
      "vtsls",
      "vue_ls",
      "yamlls",
      "jsonls",
      "emmet_language_server",
      "cssls",
      "bashls",
      -- "css_variables", "cssmodules-language-server", "lua_ls", "ty",
    },
  })
  -- vim.lsp.enable('zuban')
end

local function configure_none_ls()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug = false,
    debounce = 1000,
    sources = {
      formatting.prettierd,
      formatting.google_java_format,
      formatting.black,
      -- null_ls.builtins.completion.luasnip,
      null_ls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
      null_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
      -- diagnostics.mypy,
      diagnostics.checkstyle.with({
        extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
      }),
      require("none-ls.formatting.jq"),
      require("none-ls.diagnostics.eslint_d"),
      formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    },
  })

  local null_mason_status_ok, null_mason_ls = pcall(require, "mason-null-ls")
  if not null_mason_status_ok then
    return
  end

  null_mason_ls.setup({
    ensure_installed = {
      "jq",
      "eslint_d",
      "checkstyle",
      "sonarlint-language-server",
      "google-java-format",
    },
    automatic_installation = true,
  })
end

configure_none_ls()
configure_lsp()
