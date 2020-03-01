nnoremap <silent><buffer><expr> <Esc>  denite#do_map('quit')
inoremap <silent><buffer><expr> <Esc>  denite#do_map('quit')
inoremap <silent><buffer><expr> <cr>   denite#do_map('do_action')
nnoremap <silent><buffer><expr> q      denite#do_map('quit')
inoremap <silent><buffer><expr> <C-c>  denite#do_map('quit')
nnoremap <silent><buffer><expr> <C-c>  denite#do_map('quit')
inoremap <silent><buffer>       kj     <Esc><C-w>p
nnoremap <silent><buffer>       kj     <Esc><C-w>p
