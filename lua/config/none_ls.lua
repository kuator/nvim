local null_ls = require("null-ls")
local null_mason_ls = require("mason-null-ls")

local eslint_config = require("null-ls.utils").cosmiconfig("eslint", "eslintConfig")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local luasnip_completion = require("config.native_luasnip_completion").source()

null_ls.setup({
  debug = false,
  debounce = 1000,
  temp_dir = '/tmp',
  sources = {
    luasnip_completion,
    formatting.prettierd,
    formatting.google_java_format,
    -- formatting.black,
    null_ls.builtins.diagnostics.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
    null_ls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "postgres" } }),
    -- diagnostics.mypy,
    diagnostics.checkstyle.with({
      extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
    }),
    require("none-ls.formatting.jq"),
    require("none-ls.diagnostics.eslint_d").with({
      runtime_condition = function(params)
        return eslint_config(params.bufname) ~= nil
      end,
    }),
    formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
  },
})

null_mason_ls.setup({
  ensure_installed = {
    "jq",
    "eslint_d",
    "prettierd",
    "checkstyle",
    "google-java-format",
  },
  automatic_installation = true,
})
