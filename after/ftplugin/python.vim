let g:pyindent_open_paren = 'shiftwidth()'
" setlocal foldmethod=indent
setlocal foldlevel=0
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
