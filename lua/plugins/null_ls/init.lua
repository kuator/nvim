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
    debug = true,
    debounce = 1000,
    sources = {
      formatting.stylua.with({ extra_args = { "--indent_type", "Spaces", "indent_width", "2" } }),
      diagnostics.ruff,
      formatting.pyink,
      formatting.jq,
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
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'plenary.nvim',
    "mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = config,
}
