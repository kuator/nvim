return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    opt = true,
    config = require('plugins.cmp-and-friends.config'),
    wants = { "LuaSnip" },
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      require "plugins.cmp-and-friends.luasnip-nvim",
    },
  },
  require('plugins.cmp-and-friends.skkeleton')
}
