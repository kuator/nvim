local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
-- vim.cmd('packadd nvim-treesitter')
-- vim.cmd('packadd nvim-lspconfig')

return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim', opt = true}
    use {'mhinz/vim-signify'}
    use {'godlygeek/tabular'; opt = true; cmd = {'Tabularize'}};
    use {'neovim/nvim-lspconfig'; opt = true};

    -- syntax files
    use { 'pangloss/vim-javascript'}
    use { 'maxmellon/vim-jsx-pretty'}
    use { 'lifepillar/pgsql.vim'}
    use { 'herringtondarkholme/yats.vim'}
    use { 'hail2u/vim-css3-syntax'}
    use { 'othree/html5.vim'}
    use { 'bfrg/vim-cpp-modern'}
    use { 'vim-python/python-syntax'}
    use { 'habamax/vim-godot'}
    use { 'tikhomirov/vim-glsl'}

    -- tpope
    use {
      'tpope/vim-commentary';
      opt = true;
      keys = {{'n'; 'gcc'}; {'x'; 'gc'}; {'o'; 'gc'}; {'n'; 'gc'}};
    };
    use {
      'tpope/vim-surround';
      opt = true;
      keys = {{'n'; 'ys'}; {'x'; 'S'}};
    };
    use { 
       'tpope/vim-rsi',
       opt=true ,
       event = 'InsertEnter *' 
    };
    use {
      'tpope/vim-repeat';
      opt = true;
      keys = {{'n'; '.'}};
    };
    --

    -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      opt=true,
      requires = {{'nvim-lua/popup.nvim', opt=true}, {'nvim-lua/plenary.nvim'; opt=true}};
      event = 'InsertEnter *'
    }


    -- mattn
    use {
      'mattn/emmet-vim';
      opt = true;
      keys = {
        {'i'; '<c-x>m'};
        {'i'; '<c-x>A'};
        {'i'; '<c-x>a'};
        {'i'; '<c-x>k'};
        {'i'; '<c-x>j'};
        {'i'; '<c-x>/'};
        {'i'; '<c-x>I'};
        {'i'; '<c-x>i'};
        {'i'; '<c-x>N'};
        {'i'; '<c-x>n'};
        {'i'; '<c-x>D'};
        {'i'; '<c-x>d'};
        {'i'; '<c-x>u'};
        {'i'; '<c-x>;'};
        {'i'; '<c-x>,'};
      };
      cmd = {'Emmet'; 'EmmetInstall'};
    };

    -- andrew radev
    use {'andrewradev/tagalong.vim', opt=true;}
    use {'andrewradev/sideways.vim', opt=true;}
    use {'andrewradev/splitjoin.vim', opt=true;}

    -- kana
    use {
      'kana/vim-textobj-entire',
      opt=true,
      requires = {{'kana/vim-textobj-user', opt=true}},
      keys = {{'o'; 'ae'}, {'o'; 'ie'}, {'v'; 'ae'}, {'v'; 'ie'}}
    }

    use {
      'kana/vim-textobj-line',
      opt=true,
      requires = {{'kana/vim-textobj-user', opt=true}},
      keys = {{'o'; 'ar'}, {'o'; 'ir'}, {'v'; 'ar'}, {'v'; 'ir'}}
    }

    -- text objects
    use {
      'julian/vim-textobj-variable-segment',
      opt=true,
      keys = {{'o'; 'av'}, {'o'; 'iv'}, {'v'; 'av'}, {'v'; 'iv'}}
    }

    use {'wellle/targets.vim'}
    use {'whatyouhide/vim-textobj-xmlattr', opt=true}
    use {
      'whatyouhide/vim-textobj-xmlattr',
      opt=true,
      keys = {{'o'; 'ax'}, {'o'; 'ix'}, {'v'; 'ax'}, {'v'; 'ix'}}
    }
    use {
      'inkarkat/vim-replacewithregister',
      opt=true,
      keys = {{'n'; 'gr'}; {'o'; 'grr'}; {'x'; 'gr'};}
    }

    use {'romainl/vim-tinymru'; opt = true; cmd = {'ME'}};
    use {'liuchengxu/space-vim-dark'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'ludovicchabant/vim-gutentags'}
    use {'brookhong/cscope.vim'}
    use {'tommcdo/vim-exchange'; opt=true }
    use {'weilbith/nvim-lsp-bacomp'; opt=true }
    use {'weilbith/nvim-lsp-smag'; opt=true }

    use {
      'nvim-lua/completion-nvim',
      opt = true,
      requires = {
        {'hrsh7th/vim-vsnip', opt = true},
        {'hrsh7th/vim-vsnip-integ', opt = true},
        {'steelsojka/completion-buffers', opt = true}},
      Event = 'InsertEnter *'
    }


    --miscelanneous and unused
    use {'mattn/vim-sonictemplate', opt=true}
    use {'liuchengxu/vista.vim', opt=true}
    use {'kana/vim-textobj-indent', opt=true}
    use {'mg979/vim-visual-multi', opt=true}
    use {'psliwka/vim-smoothie',  opt=true}
    use {'norcalli/nvim-colorizer.lua', opt=true}
    use {'Guergeiro/clean-path.vim', opt=true}

  end
)
