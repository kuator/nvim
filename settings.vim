filetype plugin indent on
set nocompatible
set clipboard+=unnamedplus
let mapleader=" "
inoremap kj <esc>
" tabulation and spaces
set expandtab     
" indent width
set shiftwidth=2
" when 'sts' is negative, the value of 'shiftwidth' is used.
set softtabstop=-1
set autoindent
set number relativenumber
" comfortable searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" split window appears like it would in normal editors
set splitbelow
set splitright
set signcolumn=yes
set hidden
" https://stackoverflow.com/a/25102964
set shortmess+=c
" force lines not to wrap
set nowrap

" https://vi.stackexchange.com/a/21709
let &directory = expand(stdpath('data') .. '/swap//')
set backup
let &backupdir = expand(stdpath('data') .. '/backup//')
set undofile
let &undodir = expand(stdpath('data') .. '/undo//')

if !isdirectory(&undodir) | call mkdir(&undodir, "p") | endif
if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

" make escape responsive
set ttimeout ttimeoutlen=0

" interactive substitute
set inccommand=split

" wildmenu
set wildignore+=tags,*/__pycache__/*,build/*,build.?/*,*/node_modules/*,*/env/*
      \,*.png,*.jpg,*.jpeg,*/migrations/*,*/.git/*
" https://github.com/justinmk/config/blob/master/.config/nvim/init.vim#L1238
set suffixes+=.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
      \,.o,.obj,.dll,.class,.pyc,.ipynb,.so,.swp,.zip,.exe,.jar,.gz
set wildignorecase
set wildcharm=<C-z>
set wildmenu
set wildmode=longest:full,full

" scroll margins
" pretty comfortable when using zz and zt
set scrolloff=3      
set sidescrolloff=3

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --no-ignore-vcs\ --ignore-file\ ~/.config/.ignore
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" make vim not select match in popup
" and not insert text from match
" and open menu even if there is only one match
set completeopt=menuone,noinsert,noselect

" https://vim.fandom.com/wiki/Search_only_in_unfolded_text
set fdo-=search

" python providers for neovim
let g:python_host_prog = '/opt/.venvs/neovim2/bin/python'
let g:python3_host_prog = '/opt/.venvs/neovim3/bin/python'


set path-=/usr/include
exec 'set path+=' .. stdpath('config') .. '/**'

function! s:set_path()
  let s:root = finddir('.git/..', expand('%:p:h').';')

  if !empty(glob(s:root..'/manage.py'))
    echo 'django project'
    exec 'set path+=' .. s:root .. '/**'
  endif
endfunction

augroup MyBufferEnter
    autocmd VimEnter * call s:set_path()
augroup END

" https://vi.stackexchange.com/a/1985
au FileType * set fo-=c fo-=r fo-=o

" TODO
" rewrite favi using :find and :path

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank{"IncSearch", 200}
augroup END

" TODO
" https://code.woboq.org/llvm/clang-tools-extra/clangd/Protocol.h.html#409
