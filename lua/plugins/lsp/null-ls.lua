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
  sources = {
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua.with({ extra_args = { "--indent_type", "Spaces", "indent_width", "2" } }),
    diagnostics.flake8
  },
  -- https://github.com/MurdeRM3L0DY/dotfiles/blob/b756d26a39351366ab30086440e1fbe8655efc39/roles/nvim/files/lua/plugins/null-ls/config.lua
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then

      vim.keymap.set('n', '<leader>F', function()
        vim.lsp.buf.format { buffer = bufnr }
      end, { buffer = bufnr })
    end
  end,
})
