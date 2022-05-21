return {
  'neovim/nvim-lspconfig',
  config = function()
    require 'plugins.lsp-plugins.lsp.config'
    require 'plugins.lsp-plugins.lsp.null-ls'
  end
}
