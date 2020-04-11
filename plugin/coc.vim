let g:coc_common = {
      \  "suggest.noselect": v:false,
      \  "python.jediEnabled": v:true,
      \  "python.jediPath": "/opt/.pyenv/versions/3.8.1/lib/python3.8/site-packages",
      \  "python.venvPath": "/opt/.venvs",
      \  "solargraph.logLevel": "debug",
      \  "diagnostic.enable": v:true,
      \  "javascript.suggest.autoImports": v:true,
      \  "diagnostic.messageTarget": "echo"
      \}

let g:coc_user_config = g:coc_common


let g:coc_global_extensions =[
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-tslint-plugin',
    \ 'coc-eslint',
    \ 'coc-emmet',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-highlight',
    \ 'coc-emoji',
    \ 'coc-yaml',
    \ 'coc-actions',
    \]

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>[c <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>]c <Plug>(coc-diagnostic-next)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
vmap <leader>af  <Plug>(coc-format-selected)
nmap <leader>af  <Plug>(coc-format-selected)
nmap <leader>rn  <Plug>(coc-rename)


imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
