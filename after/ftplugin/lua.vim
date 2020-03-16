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
