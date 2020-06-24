if match(&runtimepath, 'nvim-lsp') != -1
  " nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <leader>gi    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <leader>gy   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
  set omnifunc=v:lua.vim.lsp.omnifunc
endif

" let b:vcm_tab_complete = "omni"

setlocal foldmethod=indent
setlocal foldlevel=0
setlocal expandtab     
setlocal tabstop=4
setlocal softtabstop=-1
setlocal shiftwidth=4
setlocal autoindent    
setlocal nosmarttab    
let g:pyindent_open_paren = 'shiftwidth()'

let b:vcm_tab_complete = "omni"

" call plug#load('semshi')
" Semshi enable
