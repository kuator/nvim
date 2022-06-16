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


  use(require('plugins.impatient'))

  use "nathom/filetype.nvim"
  use { 'nvim-lua/plenary.nvim', opt = true };
  use(require 'plugins.vim-gutentags')
  use(require 'plugins.tpopes')

  use {
    'Mofiqul/vscode.nvim',
    config = function()
      vim.g.vscode_style = "dark"
      vim.cmd [[colorscheme vscode]]
      vim.cmd [[hi CursorLine cterm=underline guibg=#333333]]
    end
  }

  -- use(require('plugins.darkplus-nvim'))

  -- https://github.com/jedrzejboczar/toggletasks.nvim
  -- use(require 'plugins.emmet-vim')
  use(require 'plugins.nvim-telescope')
  use(require('plugins.text-objects-operators'))
  use(require 'plugins.gitsigns')
  use(require('plugins.nvim-treesitter-plugins'))
  use(require 'plugins.lsp-plugins')
  use(require 'plugins.cmp-and-friends')
  use(require 'plugins.treesitter-unit') -- broken
  use(require 'plugins.ui')
  use(require 'plugins.stuffs')

  if bootstrap then
    require("packer").sync()
  end
end)
