if has('nvim')
  packadd denite.nvim
  call denite#custom#option('_', {
        \ 'split': 'floating',
        \ 'empty': 0,
        \ 'auto_resume': 1,
        \ 'statusline': 1,
        \ 'start_filter': 1,
        \ 'vertical_preview': 1,
        \ 'prompt': '❯',
        \ 'highlight_matched_char': 'Underlined',
        \ 'highlight_window_background': 'PMenu',
        \ })
  " call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
  " call denite#custom#var('file/rec', 'command', ['rg', '--files'])
  call denite#custom#var('file/rec', 'command', ['fd', '--full-path','--no-ignore-vcs' ,'--type', 'f', '--ignore-file', expand('~') .. '/.config/.ignore'])
endif

