" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = "\<C-y>"

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_matching_ignore_case = 1

let g:completion_items_priority = {
    \ 'Field': 5,
    \ 'Function': 7,
    \ 'Variables': 7,
    \ 'Method': 10,
    \ 'Interfaces': 5,
    \ 'Constant': 5,
    \ 'Class': 5,
    \ 'Keyword': 4,
    \ 'UltiSnips' : 1,
    \ 'vim-vsnip' : 0,
    \ 'Buffers' : 1,
    \ 'TabNine' : 0,
    \ 'File' : 0,
    \}
