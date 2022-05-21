-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local bootstrap = false

if not vim.loop.fs_stat(vim.fn.glob(install_path)) then
  os.execute('git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  bootstrap = true
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }

  use "nathom/filetype.nvim"
  use { 'nvim-lua/plenary.nvim', opt = true };
  use(require 'plugins.vim-gutentags')
  use(require 'plugins.tpopes')
  use(require 'plugins.space-vim-dark');
  -- https://github.com/jedrzejboczar/toggletasks.nvim
  use(require 'plugins.emmet-vim')
  use(require 'plugins.telescope')
  use(require('plugins.text-objects-operators'))
  use(require 'plugins.gitsigns')
  use(require('plugins.nvim-treesitter-plugins'))
  -- use(require 'plugins.skkeleton')
  use(require 'plugins.lsp-plugins')
  use(require 'plugins.cmp-and-luasnip')
  -- broken
  use(require 'plugins.treesitter-unit')
  use(require 'plugins.stuffs')

  use {
    "b0o/incline.nvim",
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
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    opt = true,
    event = "BufReadPre",
    config = function ()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")

      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  -- use(require 'plugins.treesitter-unit')

  if bootstrap then
    require("packer").sync()
  end
end)
