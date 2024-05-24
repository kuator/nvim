return {
  -- 'sindrets/diffview.nvim',
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'plenary.nvim' },
    event = { "BufReadPre", "BufNewFile" },
    -- cond = false,
    config = function()
      require 'gitsigns'.setup {
        debug_mode = true
      }
    end
  },
  -- require('plugins.neo_tree'),
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- vim.opt.list = true
      -- vim.opt.listchars:append("eol:↴")
      -- vim.opt.listchars:append("space:⋅")

      local highlight = {
              "RainbowRed",
              "RainbowYellow",
              "RainbowBlue",
              "RainbowTeal",
              "RainbowGreen",
              "RainbowOrange",
              "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
              vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ea6962" })
              vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
              vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#458588" })
              vim.api.nvim_set_hl(0, "RainbowTeal", { fg = "#8ec07c" })
              vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
              vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#e78a4e" })
              vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#83a598" })
      end)

      require("ibl").setup({
          indent = { char = "▎", tab_char = "│" },
          scope = {
            enabled=true,
            show_start = true,
            show_end = true,
            show_exact_scope = true,
            highlight = highlight,
          },
      })

    end
  },
  {
    'https://github.com/f-person/git-blame.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()

      require('gitblame').setup {
           --Note how the `gitblame_` prefix is omitted in `setup`
          enabled = true,
      }

    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  },
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen'
  }
  -- {
  --   "luukvbaal/statuscol.nvim",
  --   config = function()
  --     -- local builtin = require("statuscol.builtin")
  --     require("statuscol").setup({
  --       -- configuration goes here, for example:
  --       -- relculright = true,
  --       -- segments = {
  --       --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --       --   {
  --       --     sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
  --       --   {
  --       --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --       --     click = "v:lua.ScSa"
  --       --   },
  --       -- }
  --     })
  --   end,
  --   event = { "BufReadPre", "BufNewFile" },
  -- },

  -- {
  --   "braxtons12/blame_line.nvim",
  --   config = function()
  --     require("blame_line").setup {
  --     }
  --   end
  -- }

  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  -- https://github.com/stevearc/aerial.nvim
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
}
