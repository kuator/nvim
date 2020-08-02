" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = "\<C-y>"

let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet']},
    \{'complete_items': ['buffers']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_matching_ignore_case = 1
