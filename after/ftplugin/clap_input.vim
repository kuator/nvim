inoremap <silent> <buffer> <esc> <esc>:call clap#handler#exit()<cr>
inoremap <silent> <buffer> <c-j>  <esc>:<c-u>call clap#handler#sink()<cr>
inoremap <silent> <buffer> <c-n> <c-r>=clap#navigation#linewise('down')<cr>
inoremap <silent> <buffer> <c-p> <c-r>=clap#navigation#linewise('up')<cr>
