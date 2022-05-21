return {
  'jose-elias-alvarez/null-ls.nvim',
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
      debug = true,
      sources = {
        -- formatting.stylua.with({ extra_args = { "--indent_type", "Spaces", "indent_width", "2" } }),
        diagnostics.flake8
      },
    })
  end
}
