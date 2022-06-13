return {
  require('plugins.lualine.init'),
  -- 'sindrets/diffview.nvim',
  {
    "b0o/incline.nvim",
    opt = true,
    config = function ()
      require('incline').setup({
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          if bufname == "" then
            return "[No name]"
          else
            return vim.fn.fnamemodify(bufname, ":.")
          end
        end,
      })
    end
  },
  require('plugins.alpha'),
  {
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
    event = "BufReadPre",
    config = function ()
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
      -- vim.opt.listchars:append("space:⋅")

      require("indent_blankline").setup {
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = true,
      }
    end
  },
  {
    'j-hui/fidget.nvim',
    config = function ()
      require"fidget".setup{}
    end
  },
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
