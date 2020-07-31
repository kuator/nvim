"https://github.com/romainl/the-patient-vimmer/blob/gh-pages/3.adoc#introduction
nnoremap <leader>er  :edit */*
nnoremap <leader>ec  :edit <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>
nnoremap <leader>vc  :vs <c-r>=fnameescape(expand('%:p:h')).'/*'<cr>

" set working directory to the current buffer's directory
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cu :lcd ..<bar>pwd<cr>

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

noremap s <Nop>
inoremap kj <esc>
" vnoremap y ygv<Esc>
nnoremap ' `
omap ' `

"shitty fuzzy finder :\
nnoremap <leader>ff :find *
"grep
nnoremap <leader>lg :silent lgrep<Space>
autocmd QuickFixCmdPost [^l]* cwindow

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

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" default folding mappings in vim suck, my pinkie hurts
nnoremap sf z
nnoremap sf z
nnoremap sft za
nnoremap sfT zA

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
