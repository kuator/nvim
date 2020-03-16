packadd minpac
"{{{
call minpac#init()
call minpac#add('pangloss/vim-javascript')
call minpac#add('lifepillar/pgsql.vim')
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('othree/html5.vim')
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-rsi')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-line')
call minpac#add('kana/vim-textobj-function')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('liuchengxu/vim-clap',  { 'type':'opt', 'do': ':Clap install-binary'})
call minpac#add('liuchengxu/space-vim-theme')
call minpac#add('liuchengxu/vista.vim')
call minpac#add('AndrewRadev/dsf.vim')
call minpac#add('AndrewRadev/tagalong.vim')
call minpac#add('AndrewRadev/sideways.vim')
call minpac#add('AndrewRadev/splitjoin.vim')
call minpac#add('godlygeek/tabular')
call minpac#add('thinca/vim-textobj-function-javascript')
call minpac#add('Julian/vim-textobj-variable-segment')
call minpac#add('wellle/targets.vim')
call minpac#add('saaguero/vim-textobj-pastedtext')
call minpac#add('whatyouhide/vim-textobj-xmlattr')
call minpac#add('sirver/ultisnips', {'type': 'opt'})
call minpac#add('easymotion/vim-easymotion')
call minpac#add('vim-scripts/FavEx')
call minpac#add('godlygeek/tabular')
call minpac#add('romainl/vim-tinyMRU')
call minpac#add('ludovicchabant/vim-gutentags')
" call minpac#add('osyo-manga/vim-over')
" call minpac#add('Yggdroot/indentLine')
call minpac#add('ajh17/VimCompletesMe')
call minpac#add('flazz/vim-colorschemes')
call minpac#add('mhinz/vim-signify')
call minpac#add('arzg/vim-colors-xcode')
call minpac#add('lifepillar/vim-gruvbox8')
call minpac#add('PsychoLlama/z.vim')
call minpac#add('davidhalter/jedi-vim', {'type': 'opt'})
call minpac#add('neomake/neomake')
call minpac#add('psliwka/vim-smoothie')
" call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins', 'type': 'opt' })


call minpac#add('norcalli/nvim-colorizer.lua', {'type': 'opt'})
call minpac#add('numirias/semshi', {'type': 'opt', 'do': ':UpdateRemotePlugins'})
call minpac#add('neovim/nvim-lsp', {'type': 'opt'})
call minpac#add('haorenW1025/diagnostic-nvim', {'type': 'opt'})
call minpac#add('pechorin/any-jump.nvim', {'type': 'opt'})
call minpac#add('jeetsukumaran/vim-pythonsense', {'type': 'opt'})
call minpac#add('bps/vim-textobj-python', {'type': 'opt'})
call minpac#add('kkoomen/vim-doge', {'type': 'opt'})
call minpac#add('heavenshell/vim-pydocstring', {'type': 'opt'})
call minpac#add('Vimjas/vim-python-pep8-indent', {'type': 'opt'})
call minpac#add('rbtnn/vim-jumptoline', {'type': 'opt'})
call minpac#add('sbdchd/neoformat', {'type': 'opt'})
call minpac#add('omnisharp/omnisharp-vim', {'type': 'opt'})
call minpac#add('cloudhead/neovim-fuzzy', {'type': 'opt'})
call minpac#add('matze/vim-move', {'type': 'opt'})
call minpac#add('rhysd/vim-textobj-anyblock', {'type': 'opt'})
call minpac#add('chrisbra/improvedft', {'type': 'opt'})
call minpac#add('gpanders/vim-oldfiles', {'type': 'opt'})
call minpac#add('haorenW1025/completion-nvim', {'type': 'opt'})
call minpac#add('LinArcX/mpi', {'type': 'opt'})
call minpac#add('chaoren/vim-wordmotion', {'type': 'opt'})
call minpac#add('mg979/vim-visual-multi', {'type': 'opt'})
call minpac#add('machakann/vim-swap', {'type': 'opt'})
call minpac#add('Shougo/neosnippet.vim')
call minpac#add('dhruvasagar/vim-zoom')
call minpac#add('henricattoire/aergia', {'type': 'opt'})
call minpac#add('rbtnn/vim-mrw', {'type': 'opt'})
" call minpac#add('rhysd/clever-f.vim')

if has('nvim')
  packadd nvim-colorizer.lua
  packadd vim-clap
  packadd semshi
  packadd nvim-lsp
  " packadd vim-wordmotion
endif

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
"}}}

let mapleader = "\<Space>"
let maplocalleader = "s"

filetype plugin indent on
runtime macros/matchit.vim
set nocompatible
set clipboard=unnamedplus
set termguicolors
" map s <nop>

" Tabulation and spaces
set expandtab                                                               " Show spaces instead of tabs
set shiftwidth=0                                                    " columns per <<
set softtabstop=-1                                                          " spaces per tab
set tabstop=2                                                        " spaces per tab
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
set signcolumn=yes
set wildmode=longest:full,full
set wildmenu
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
exec 'set path+=' .. $VIM_HOME .. '/**' .. ',src/app/**,Assets/Scripts/**'

if has('nvim')
  "python providers for neovim
  let g:python_host_prog = '/opt/.venvs/neovim2/bin/python'
  let g:python3_host_prog = '/opt/.venvs/neovim3/bin/python'

  set wildoptions+=pum

  "interactive substitute
  set inccommand=split
  set pumblend=5
endif

if !has('nvim')
  "https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
endif

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" set iskeyword+=-


" Auto close popup menu when finish completion
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
set completeopt-=preview
