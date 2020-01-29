packadd minpac

call minpac#init()
  call minpac#add('pangloss/vim-javascript')
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
  call minpac#add('AndrewRadev/dsf.vim')
  call minpac#add('AndrewRadev/tagalong.vim')
  call minpac#add('thinca/vim-textobj-function-javascript')
  call minpac#add('wellle/targets.vim')
  call minpac#add('whatyouhide/vim-textobj-xmlattr')
  call minpac#add('sirver/ultisnips', {'type': 'opt'})
  call minpac#add('easymotion/vim-easymotion')
  call minpac#add('vim-scripts/FavEx')
  call minpac#add('godlygeek/tabular')
  call minpac#add('romainl/vim-tinyMRU')
  call minpac#add('ludovicchabant/vim-gutentags')
  call minpac#add('osyo-manga/vim-over')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('ajh17/VimCompletesMe', {'type':'opt'})
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('flazz/vim-colorschemes')
  call minpac#add('arzg/vim-colors-xcode')
  call minpac#add('kuator/z.vim')

  if has('nvim')
    call minpac#add('norcalli/nvim-colorizer.lua')
  endif

  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

let mapleader = "\<Space>"

filetype plugin indent on
runtime macros/matchit.vim
set nocompatible
set clipboard=unnamedplus
set termguicolors
" map s <nop>

" Tabulation and spaces
set expandtab                                                               " Show spaces instead of tabs
set shiftwidth=2                                                            " columns per <<
set softtabstop=-1                                                          " spaces per tab
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

let mapleader="\<Space>"
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
set wildignorecase
set wildcharm=<C-z>
set suffixes+=.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
      \,.o,.obj,.dll,.class,.pyc,.ipynb,.so,.swp,.zip,.exe,.jar,.gz

"scroll margins
"pretty comfortable when using zz and zt
set scrolloff=3      
set sidescrolloff=3


" let $PLUGINS_SETTINGS=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))."/plugins.settings.d"
" let $AFTER_PLUGINS_SETTINGS=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))."/after/plugin"
" set path-=/usr/include
" set path+=src/app/**,$PLUGINS_SETTINGS,$AFTER_PLUGINS_SETTINGS,$VIM_HOME,Assets/Scripts/**

" let &runtimepath = $VIM_HOME.'/plugins.settings.d'.','.&runtimepath

"echo expand(&runtimepath)
" for f in split(glob(expand($VIM_HOME).'/plugins.settings.d/*.vim'), '\n')
"   exe 'source' f
" endfor

let $VIM_HOME=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))
let $AFTER_PLUGIN=$VIM_HOME."/after/plugin"
let $PLUGIN=$VIM_HOME."/plugin"
set path-=/usr/include
set path+=$PLUGIN,$AFTER_PLUGIN,$VIM_HOME,src/app/**,Assets/Scripts/**

if has('nvim')
  "python providers for neovim
  let g:loaded_python_provider = 1
  let g:python_host_skip_check=1
  let g:python_host_prog = '/opt/.venvs/neovim2/bin/python'
  let g:python3_host_skip_check=1
  let g:python3_host_prog = '/opt/.venvs/neovim3/bin/python'

  set wildoptions+=pum

  "https://github.com/norcalli/nvim-colorizer.lua
  " lua require'colorizer'.setup()

  "interactive substitute
  set inccommand=split

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

set iskeyword+=-
