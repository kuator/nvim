return {
  "jose-elias-alvarez/null-ls.nvim",
  requires = 'nvim-lua/plenary.nvim',
  config = function()
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
        -- require("plugins.lsp-plugins.null-ls.sources.darker").with({
        --   extra_args = { "--isort" },
        -- }),
        formatting.stylua.with({ extra_args = { "--indent_type", "Spaces", "indent_width", "2" } }),
        -- diagnostics.flake8,
        diagnostics.ruff,
        formatting.autopep8,
      },
    })
  end,
}
