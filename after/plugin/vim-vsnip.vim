" NOTE: You can use other key to expand snippet.
let g:vsnip_snippet_dir=stdpath('config')..'/snippets'

" Expand
" imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-k> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"
smap <expr> <C-k> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"
xmap <expr> <C-k> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-k>"
imap <expr> <C-j> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"
xmap <expr> <C-j> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"
smap <expr> <C-j> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-j>"

smap        <C-h>   <Plug>(vsnip-cut-text)
