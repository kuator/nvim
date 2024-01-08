return {
  {
    "Wansmer/treesj",
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
      vim.keymap.set("n", "<leader>j", "<cmd>TSJToggle<cr>")
    end,
    keys = { { mode = "n", "<leader>j" } },
  },

  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline

      require("outline").setup({})
    end,
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
  },
  {
    "stevearc/aerial.nvim",
    -- Optional dependencies
    lazy = true,
    config = function()
      require("aerial").setup({})
    end,
    cmd = { "AerialToggle", "AerialNext", "AerialPrev" },
  },

  -- {
  --   'simrat39/symbols-outline.nvim',
  --   lazy = true
  -- },

  -- {
  --   'seandewar/bad-apple.nvim',
  --   lazy = true,
  --   cmd = {'BadApple'}
  -- };
  { "https://github.com/Eandrju/cellular-automaton.nvim", lazy = true, cmd = { "CellularAutomaton" } },
  {
    "leafOfTree/vim-vue-plugin",
    ft = "vue",
  },
  {
    "MaxMEllon/vim-jsx-pretty",
    ft = { "javascript", "javascriptreact" },
  },
  {
    "dhruvasagar/vim-zoom",
    lazy = true,
    keys = { { mode = "n", "<c-w>m" } },
  },
  "godlygeek/tabular",
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('illuminate').configure({
        delay= 200
      })

      vim.api.nvim_set_hl(0, "IlluminatedWord", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
      vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

    end,
  },
  {
    "andymass/vim-matchup",
    event = { "BufReadPre", "BufNewFile" },
  },
  "junkblocker/git-time-lapse",
  {
    "carbon-steel/detour.nvim",
    config = function()
      vim.keymap.set("n", "<c-w><enter>", ":Detour<cr>")
    end,
  },

  -- TODO: Investigate
  -- https://github.com/rlane/pounce.nvim
  -- require 'plugins.nvimux'
  -- https://github.com/mg979/vim-visual-multi
}
