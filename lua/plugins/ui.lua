return {
  -- 'sindrets/diffview.nvim',
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'plenary.nvim' },
    event = { "BufReadPre", "BufNewFile" },
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
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
      -- vim.opt.listchars:append("space:⋅")

      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
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
  -- {
  --   "SmiteshP/nvim-gps",
  --   config = function ()
  --     require("nvim-gps").setup()
  --     _G.gps_location = function()
  --       local gps = require "nvim-gps"
  --       return gps.is_available() and gps.get_location() or ""
  --     end
  --     vim.opt.winbar:append " "
  --     vim.opt.winbar:append "%{%v:lua.gps_location()%}"
  --   end
  -- }

  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  -- https://github.com/stevearc/aerial.nvim
  -- https://github.com/rockyzhang24/dotfiles/blob/master/.config/nvim/lua/winbar.lua
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
}
