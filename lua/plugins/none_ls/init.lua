local function config()
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
    ensure_installed = nil,
    automatic_installation = true,
  })
end

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "plenary.nvim",
    "mason.nvim",
    "jay-babu/mason-null-ls.nvim",
    "https://github.com/nvimtools/none-ls-extras.nvim",
  },
  config = config,
}
