if has('vim_starting')
  if !isdirectory(expand('~/.config/nvim/autoload'))
    echo 'install vim-plug...'
    call system('curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  end
endif


"{{{ Plugins
call plug#begin('$XDG_CACHE_HOME/nvim/plugged')

"{{{ Syntax files
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'lifepillar/pgsql.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
"}}}
"{{{ tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
"}}}
"{{{ kana
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'"}}}
"{{{ liuchengxu
Plug 'liuchengxu/vim-clap',  {'do': ':Clap install-binary'}
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/vista.vim'
"}}}
"{{{ andrewradev
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
"}}}


"{{{ text objects
Plug 'thinca/vim-textobj-function-javascript'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'wellle/targets.vim'
Plug 'saaguero/vim-textobj-pastedtext'
Plug 'whatyouhide/vim-textobj-xmlattr'
"}}}

"{{{ miscleannious
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-asterisk'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi'
Plug 'kuator/favi'
Plug 'romainl/vim-tinyMRU'
Plug 'godlygeek/tabular'
Plug 'ludovicchabant/vim-gutentags'
Plug 'dhruvasagar/vim-zoom'
Plug 'flazz/vim-colorschemes'
Plug 'arzg/vim-colors-xcode'
Plug 'psliwka/vim-smoothie'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"}}}


Plug 'nathanaelkane/vim-indent-guides', {'on': []}
Plug 'sirver/ultisnips', {'on': []} 
Plug 'machakann/vim-highlightedyank', {'on': []}
Plug 'davidhalter/jedi-vim', {'on': []} 
Plug 'osyo-manga/vim-over', {'on': []}
Plug 'Yggdroot/indentLine', {'on': []}
Plug 'ajh17/VimCompletesMe', {'on': []}
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins', 'on': [] }
Plug 'neovim/nvim-lsp', {'on': []} 
Plug 'haorenW1025/diagnostic-nvim', {'on': []} 
Plug 'pechorin/any-jump.nvim', {'on': []} 
Plug 'jeetsukumaran/vim-pythonsense', {'on': []} 
Plug 'bps/vim-textobj-python', {'on': []} 
Plug 'kkoomen/vim-doge', {'on': []} 
Plug 'heavenshell/vim-pydocstring', {'on': []} 
Plug 'Vimjas/vim-python-pep8-indent', {'on': []} 
Plug 'rbtnn/vim-jumptoline', {'on': []} 
Plug 'sbdchd/neoformat', {'on': []} 
Plug 'omnisharp/omnisharp-vim', {'on': []} 
Plug 'cloudhead/neovim-fuzzy', {'on': []} 
Plug 'matze/vim-move', {'on': []} 
Plug 'rhysd/vim-textobj-anyblock', {'on': []} 
Plug 'chrisbra/improvedft', {'on': []} 
Plug 'gpanders/vim-oldfiles', {'on': []} 
Plug 'haorenW1025/completion-nvim', {'on': []} 
Plug 'LinArcX/mpi', {'on': []} 
Plug 'chaoren/vim-wordmotion', {'on': []} 
Plug 'machakann/vim-swap', {'on': []} 
Plug 'relastle/vim-nayvy', {'on': []} 
Plug 'henricattoire/aergia', {'on': []} 
Plug 'aaronbieber/vim-quicktask', {'on': []} 
Plug 'rbtnn/vim-mrw', {'on': []} 
Plug 'voldikss/vim-floaterm', {'on': []} 
Plug 'tpope/vim-projectionist', {'on': []} 
Plug 'rhysd/clever-f.vim', {'on': []}
call plug#end()"}}}


let mapleader = "\<Space>"
let maplocalleader = "s"

filetype plugin indent on
runtime macros/matchit.vim
set nocompatible
set clipboard=unnamedplus

" Tabulation and spaces
set expandtab     
set shiftwidth=2
set softtabstop=-1
set autoindent

set number
set relativenumber
set incsearch
set hlsearch
set ignorecase
set smartcase
set nowrap
set mouse=n
set nobackup
set nowritebackup
set noswapfile
set splitbelow
set splitright
set laststatus=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set ttimeout ttimeoutlen=0

set signcolumn=yes
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.spec.ts
set wildignore+=*.pdf,*.psd
set wildignore+=*node_modules/*,*bower_components/*,plugged/*
set wildignore+=tags,gwt-unitCache/*,*/__pycache__/*,build/*,build.?/*
set wildignore+=**/pack/** 
set wildignorecase
set wildcharm=<C-z>
set suffixes+=.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
      \,.o,.obj,.dll,.class,.pyc,.ipynb,.so,.swp,.zip,.exe,.jar,.gz

"scroll margins
"pretty comfortable when using zz and zt
set scrolloff=3      
set sidescrolloff=3

" path settings 
let $VIM_HOME=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))
set path-=/usr/include
" exec 'set path+=' .. $VIM_HOME .. '/**' .. ',src/app/**,Assets/Scripts/**'
exec 'set path+=' .. stdpath('config') .. '/**' .. ',src/app/**,Assets/Scripts/**'

"python providers for neovim
let g:python_host_prog = '/opt/.venvs/neovim2/bin/python'
let g:python3_host_prog = '/opt/.venvs/neovim3/bin/python'

set wildoptions+=pum

"interactive substitute
set inccommand=split
set pumblend=5

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --no-ignore-vcs\ --ignore-file\ ~/.config/.ignore
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert 
set completeopt-=preview

"https://vim.fandom.com/wiki/Search_only_in_unfolded_text
set fdo-=search
