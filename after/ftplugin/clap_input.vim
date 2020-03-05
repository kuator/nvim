" inoremap <silent> <buffer> <C-n> <C-R>=clap#navigation#linewise('down')<CR>
" inoremap <silent> <buffer> <C-p> <C-R>=clap#navigation#linewise('up')<CR>
inoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>
nnoremap <silent> <buffer> <Esc> <Esc>:call clap#handler#exit()<CR>
nnoremap <silent> <buffer> sv  :<c-u>call clap#handler#try_open('ctrl-v')<CR>
nnoremap <silent> <buffer> ss  :<c-u>call clap#handler#try_open('ctrl-x')<CR>
nnoremap <silent> <buffer> st  :<c-u>call clap#handler#try_open('ctrl-t')<CR>
