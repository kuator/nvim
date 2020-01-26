" emmet.vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-E>'
autocmd FileType html,css,javascript EmmetInstall
let g:user_emmet_mode='iv'  "enable all functions, which is equal to
imap <C-e><C-e> <plug>(emmet-expand-abbr)
