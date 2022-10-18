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
        -- wants = { "friendly-snippets" },
        -- wants = { "vim-snippets" },
        -- requires = {
          -- "rafamadriz/friendly-snippets",
          -- "honza/vim-snippets",
        -- },
        opt = true,
        config = function ()
          -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/friendly-snippets" } })
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { './snippets' } })
          -- require("luasnip.loaders.from_snipmate").lazy_load()
          -- require("luasnip.loaders.from_vscode").lazy_load()
        end
      }
    },
  },
  require('plugins.cmp-and-friends.skkeleton')
}
