"https://github.com/romainl/the-patient-vimmer/blob/gh-pages/3.adoc#introduction
nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>
nnoremap <leader>er  :edit **/*
" nnoremap <leader>er :edit <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>
nnoremap <leader>vc  :vs <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>


"shitty fuzzy finder :\
nnoremap <leader>ff :find *
nnoremap <leader>fr :find **/*


nnoremap gb :ls<CR>:b<Space>

"grep
nnoremap <leader>lg :silent lgrep<Space>
nnoremap <leader>lf :silent lexpr system('fdfind -g "*"')<left><left><left><left>
autocmd QuickFixCmdPost [^l]* cwindow
nnoremap <leader>lt :silent ltag<Space>/
nnoremap <leader>cc :silent cclose<bar>lclose<cr>
nnoremap <c-c><c-c> :q!

" set working directory to the current buffer's directory
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cu :lcd ..<bar>pwd<cr>

"abbreviations for easier typing
inoreabbr lam =>
inoreabbr far =>
inoreabbr tar ->
inoreabbr ex !
inoreabbr pl +
cnoreabbr lam =>
cnoreabbr far =>
cnoreabbr tar ->

tnoremap <esc> <C-\><C-n>
nnoremap <silent><c-l> <c-l>:nohl<cr>

" stolen from emacs
" cnoremap <c-g> <c-c>
nnoremap <a-c> :
nnoremap <a-p> <c-p>
nnoremap <a-n> <c-n>

nnoremap s <Nop>
inoremap kj <esc>
" vnoremap y ygv<Esc>
nnoremap ' `
omap ' `


" https://superuser.com/questions/604122/vim-file-name-completion-relative-to-current-file
autocmd InsertEnter * let save_cwd = getcwd() | execute 'lcd' expand('%:p:h')
autocmd InsertLeave * execute 'lcd' fnameescape(save_cwd)

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" default fold mapping sucks, my pinkie is hurting
nnoremap sf z

iabbrev shrug ¯\_(ツ)_/¯
iabbrev tableflip (╯°□°）╯彡┻━┻

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" TODO
" rewrite favi using :find and :path

