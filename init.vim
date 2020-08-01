if has('vim_starting')
  if !isdirectory(expand('$XDG_DATA_HOME/nvim/site/autoload'))
    echo 'install vim-plug...'
    call system('curl -fLo "${XDG_DATA_HOME}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
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
"{{{ liuchengxu
Plug 'liuchengxu/vim-clap',  {'do': ':Clap install-binary!'}
Plug 'liuchengxu/space-vim-theme'
Plug 'liuchengxu/vista.vim'
"}}}
"{{{ andrewradev
Plug 'AndrewRadev/dsf.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
"}}}
"{{{ kana
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
"}}}
"{{{ text objects
Plug 'Julian/vim-textobj-variable-segment'
Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'inkarkat/vim-ReplaceWithRegister'
"}}}

"{{{ miscleannious
Plug 'ajh17/VimCompletesMe', {'on': []}
Plug 'neovim/nvim-lsp', {'on': []}
Plug 'sirver/ultisnips', {'on': []} 
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'neomake/neomake'
Plug 'mhinz/vim-signify'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi'
Plug 'kuator/favi'
Plug 'romainl/vim-tinyMRU'
Plug 'godlygeek/tabular'
Plug 'ludovicchabant/vim-gutentags'
Plug 'flazz/vim-colorschemes'
Plug 'arzg/vim-colors-xcode'
Plug 'sainnhe/gruvbox-material'
Plug 'psliwka/vim-smoothie'
Plug 'norcalli/nvim-colorizer.lua'
"}}}

call plug#end()"}}}

call plug#load('nvim-lsp')
call plug#load('VimCompletesMe')
" call plug#load('completion-nvim')

runtime macros/matchit.vim

filetype plugin indent on
let mapleader = "\<Space>"

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
" https://stackoverflow.com/a/25102964
set shortmess+=c
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.spec.ts
set wildignore+=*.pdf,*.psd
set wildignore+=*node_modules/*,*bower_components/*,plugged/*,*env/*
set wildignore+=tags,gwt-unitCache/*,*/__pycache__/*,build/*,build.?/*
set wildignorecase
set wildcharm=<C-z>
set suffixes+=.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
      \,.o,.obj,.dll,.class,.pyc,.ipynb,.so,.swp,.zip,.exe,.jar,.gz

"scroll margins
"pretty comfortable when using zz and zt
set scrolloff=3      
set sidescrolloff=3

" path settings 
" let $VIM_HOME=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))
set path-=/usr/include
exec 'set path+=' .. stdpath('config') .. '/**' .. ',src/app/**,Assets/Scripts/**'

"python providers for neovim
let g:python_host_prog = '/opt/.venvs/neovim2/bin/python'
let g:python3_host_prog = '/opt/.venvs/neovim3/bin/python'

set wildoptions+=pum

"interactive substitute
set inccommand=split

if &termguicolors 
  set pumblend=5
endif

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --no-ignore-vcs\ --ignore-file\ ~/.config/.ignore
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert 
" set completeopt-=preview
set completeopt=menuone,noinsert,noselect

"https://vim.fandom.com/wiki/Search_only_in_unfolded_text
set fdo-=search

syntax on
