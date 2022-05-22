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
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        requires = "rafamadriz/friendly-snippets",
        opt = true,
        config = function ()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      }
    },
  },
  require('plugins.cmp-and-friends.skkeleton')
}
