return {
  'kuator/some-python-plugin.nvim',
  "williamboman/nvim-lsp-installer",
  {
    "williamboman/mason.nvim",
    branch = "alpha",
    config = function ()
      require("mason").setup{}
    end
  },
  require "plugins.lsp-plugins.null-ls",
  require "plugins.lsp-plugins.lspkind",
  require "plugins.lsp-plugins.aerial",
  require 'plugins.lsp-plugins.lsp',
}
