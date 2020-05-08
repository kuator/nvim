" highlight! link CursorLine Visual
nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr> t    denite#do_map('do_action', 'tabopen')
nnoremap <silent><buffer><expr> v    denite#do_map('do_action', 'vsplit')
nnoremap <silent><buffer><expr> h    denite#do_map('do_action', 'split')
nnoremap <silent><buffer><expr> -    denite#do_map('do_action', 'split')
nnoremap <silent><buffer><expr> q    denite#do_map('quit')
nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
