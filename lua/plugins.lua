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

  use(require 'plugins.vim-gutentags')

  use "nathom/filetype.nvim"

  use { 'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }

  use {
    'tpope/vim-commentary';
    opt = true;
    keys = { { 'x'; 'gc' }; { 'n'; 'gc' } };
  };

  use {
    'dhruvasagar/vim-zoom';
    opt = true;
    keys = { { 'n'; '<c-w>m' } };
  };

  use {
    'tpope/vim-surround';
    opt = true;
    keys = { { 'n'; 'ys' }; { 'x'; 'S' }; { 'n'; 'cs' }; };
  };

  use {
    'leafOfTree/vim-vue-plugin';
    ft = 'vue';
  };

  use {
    'MaxMEllon/vim-jsx-pretty';
    ft = { 'javascript', 'javascriptreact' };
  };

  use {
    'inkarkat/vim-ReplaceWithRegister';
    opt = true;
    keys = { { 'n'; 'gr' }; { 'x'; 'gr' }; };
  };

  use { 'nvim-lua/plenary.nvim', opt = true };

  use {
    'tpope/vim-unimpaired';
    opt = true;
    keys = { { 'n'; '[p' }; { 'n'; ']p' }; { 'n'; '[l' }; { 'n'; ']l' }; }
  };

  use { 'wellle/targets.vim' };

  use(require 'plugins.space-vim-dark');

  use { 'kana/vim-textobj-user', opt = true };

  -- use(require 'plugins.nvim-trevj')

  use { 'noib3/nvim-compleet', opt = true };

  -- https://github.com/jedrzejboczar/toggletasks.nvim

  -- use {
  --   'nvim-lualine/lualine.nvim',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  --   config=function()
  --     require'lualine'.setup()
  --   end
  -- }


  use(require 'plugins.vim-textobj-line')

  use(require 'plugins.vim-textobj-entire')

  use {
    'tpope/vim-repeat';
    opt = true;
    keys = { { 'n'; '.' } };
  };


  use {
    'tpope/vim-rsi',
    opt = true,
    event = 'InsertEnter'
  };

  use {
    'seandewar/bad-apple.nvim',
    opt = true
  };

  use {
    'Julian/vim-textobj-variable-segment';
    opt = true;
    wants = 'vim-textobj-user';
    keys = { { 'o'; 'iv' }; { 'o'; 'av' }; { 'x'; 'iv' }; { 'x'; 'av' }; };
  };

  use(require 'plugins.emmet-vim')

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true }

  use { 'tami5/sql.nvim', opt = true }

  use {
    "nvim-telescope/telescope-frecency.nvim",
    opt = true,
    wants = { "sql.nvim" }
  }

  use(require 'plugins.telescope')

  use(require 'plugins.gitsigns')


  use "jose-elias-alvarez/null-ls.nvim"

  use "williamboman/nvim-lsp-installer"

  use(require 'plugins.lsp')


  use {
    'kuator/some-python-plugin.nvim',
  }

  use {
    'simrat39/symbols-outline.nvim',
    opt = true
  }

  use(require 'plugins.nvim-treesitter')

  -- broken
  use(require 'plugins.treesitter-unit')
  if bootstrap then
    require("packer").sync()
  end
end)
