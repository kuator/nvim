augroup Jedi
	"autocmd!
        "autocmd FileType python packadd jedi-vim
        "autocmd FileType python setlocal omnifunc=jedi#completions

        ""jedi-vim
        "autocmd FileType python nnoremap <silent><buffer><leader>gd :call jedi#goto()<cr>
        "autocmd FileType python nnoremap <silent><buffer><leader>rn :call jedi#rename()<cr>
        "autocmd FileType python nnoremap <silent><buffer><leader>gr :call jedi#usages()<cr>
        "autocmd FileType python nnoremap <silent><buffer>K :call jedi#show_documentation()<cr>
augroup END
