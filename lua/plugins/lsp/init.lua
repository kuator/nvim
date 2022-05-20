return {
  'neovim/nvim-lspconfig',
  requires = { 'some-python-plugin.nvim', 'nvim-lsp-installer' },
  config = function()
    require 'plugins.lsp.config'
    require "plugins.lsp.null-ls"
  end
}
