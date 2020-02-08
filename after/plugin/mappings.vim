"https://github.com/romainl/the-patient-vimmer/blob/gh-pages/3.adoc#introduction
 
nnoremap <leader>er  :edit **/*
nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>
nnoremap <leader>vc  :vs <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>

" set working directory to the current buffer's directory
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cu :lcd ..<bar>pwd<cr>

"https://github.com/romainl/vim-tinyMRU/blob/master/doc/tinymru.txt
set wildcharm=<C-z>
nnoremap <leader>fo :ME <C-z>

inoreabbr lam =>
inoreabbr far =>
inoreabbr tar ->
inoreabbr ex ! 
inoreabbr pl +
tnoremap <esc> <C-\><C-n>
nnoremap <silent><c-l> <c-l>:nohl<cr>

inoremap kj <esc>
vnoremap y ygv<Esc>
nnoremap ' `
omap ' `

"FavEx.vim
unmap <leader>ff
unmap <leader>fd
nnoremap <leader>faf :FFile<cr>
nnoremap <leader>fad :FDirectory<cr>
"shitty fuzzy finder :\
nnoremap <leader>ff :find *
"z.vim
nnoremap <leader>zd :Z 

"grep
nnoremap <leader>gr :silent lgrep<Space>

" https://superuser.com/questions/604122/vim-file-name-completion-relative-to-current-file
autocmd InsertEnter * let save_cwd = getcwd() | execute 'lcd' expand('%:p:h')
autocmd InsertLeave * execute 'lcd' fnameescape(save_cwd)

"https://vi.stackexchange.com/questions/11232/vimscript-how-do-you-get-file-directory-vim-was-called-on-from-the-command-lin
" Returns the directory of the first file in `argv` or `cwd` if it's empty
" function FindSessionDirectory() abort
"   if len(argv()) > 0
"     return fnamemodify(argv()[0], ':p:h')
"   endif
"   return getcwd()
" endfunction!
" let g:session_default_name = FindSessionDirectory()
