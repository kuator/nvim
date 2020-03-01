" inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
" inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
inoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>
nnoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>
nnoremap <silent> <buffer> v <Esc>:call clap#handler#exit()<CR>
