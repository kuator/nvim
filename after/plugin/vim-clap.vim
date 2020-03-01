"vim-clap
" nnoremap <leader><leader>f :Clap files ++finder=fd --hidden<cr>
nnoremap <silent><leader><leader>f :Clap files ++finder=rg --files --follow --hidden --no-ignore-vcs --ignore-file ~/.config/.ignore<cr>
nnoremap <silent><leader><leader>f :Clap files ++finder=fd --type f --type l  --no-ignore-vcs --hidden --ignore-file ~/.config/.ignore <cr>
