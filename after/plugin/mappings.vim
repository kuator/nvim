"https://github.com/romainl/the-patient-vimmer/blob/gh-pages/3.adoc#introduction
nnoremap <leader>er  :edit **/*
nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>

" set working directory to the current buffer's directory
nnoremap cdc :lcd %:p:h<bar>pwd<cr>
nnoremap cdu :lcd ..<bar>pwd<cr>

"https://github.com/romainl/vim-tinyMRU/blob/master/doc/tinymru.txt
set wildcharm=<C-z>
nnoremap <leader>of :ME <C-z>

inoreabbr lam =>
inoreabbr far =>
inoreabbr tar ->
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
