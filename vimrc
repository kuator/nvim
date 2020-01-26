packadd minpac

call minpac#init()
  call minpac#add('tpope/vim-repeat')
  call minpac#add('pangloss/vim-javascript')
  call minpac#add('MaxMEllon/vim-jsx-pretty')
  call minpac#add('machakann/vim-sandwich')
  call minpac#add('hail2u/vim-css3-syntax')
  call minpac#add('othree/html5.vim')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('flazz/vim-colorschemes')
  call minpac#add('godlygeek/tabular')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-entire')
  call minpac#add('kana/vim-textobj-line')
  call minpac#add('wellle/targets.vim')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('SirVer/ultisnips')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('easymotion/vim-easymotion')
  call minpac#add('vim-scripts/FavEx')
  call minpac#add('romainl/vim-tinyMRU')
  call minpac#add('osyo-manga/vim-over')

  if has('nvim')
    call minpac#add('norcalli/nvim-colorizer.lua', {'type': 'opt'})
  endif

  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

let mapleader = "\<Space>"

filetype plugin indent on
syntax enable
runtime macros/matchit.vim
set nocompatible
set clipboard=unnamedplus
" map s <nop>

" Tabulation and spaces
set termguicolors
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

let mapleader="\<Space>"
set ttimeoutlen=50
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


let $PLUGINS_SETTINGS=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))."/plugins.settings.d"
let $AFTER_PLUGINS_SETTINGS=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))."/after/plugin"
let $VIM_HOME=expand(fnamemodify(resolve(expand('<sfile>:p')), ':p:h'))

set path-=/usr/include
set path+=src/app/**,$PLUGINS_SETTINGS,$AFTER_PLUGINS_SETTINGS

" echo expand(&runtimepath)

if has('nvim')
  "python providers for neovim
  let g:python_host_prog = '/opt/.venvs/neovim2/bin/python'
  let g:python3_host_prog = '/opt/.venvs/neovim3/bin/python'

  set wildoptions+=pum

  "https://github.com/norcalli/nvim-colorizer.lua
  " lua require'colorizer'.setup()

  "interactive substitute
  set inccommand=split

endif

" let &runtimepath = $VIM_HOME.'/plugins.settings.d'.','.&runtimepath.','

for f in split(glob(expand($VIM_HOME).'/plugins.settings.d/*.vim'), '\n')
  exe 'source' f
endfor

