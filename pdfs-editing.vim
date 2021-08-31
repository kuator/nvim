let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/payda/paydabackend
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
set stal=2
tabnew
tabnew
tabrewind
edit api/views.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 113 + 114) / 228)
exe '2resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 113 + 114) / 228)
exe 'vert 3resize ' . ((&columns * 114 + 114) / 228)
argglobal
balt api/excel.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1938 - ((23 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1938
normal! 019|
lcd ~/Documents/payda/paydabackend
wincmd w
argglobal
if bufexists("~/Documents/payda/paydabackend/api/views.py") | buffer ~/Documents/payda/paydabackend/api/views.py | else | edit ~/Documents/payda/paydabackend/api/views.py | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/payda/paydabackend/api/views.py
endif
balt ~/Documents/payda/paydabackend/api/urls.py
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1523 - ((7 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1523
normal! 09|
lcd ~/Documents/payda/paydabackend
wincmd w
argglobal
if bufexists("~/.config/nvim/init.lua") | buffer ~/.config/nvim/init.lua | else | edit ~/.config/nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/init.lua
endif
balt ~/Documents/payda/paydabackend/payda/templates/payment.html
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 76 - ((21 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 76
normal! 011|
lcd ~/Documents/payda/paydabackend
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 113 + 114) / 228)
exe '2resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 113 + 114) / 228)
exe 'vert 3resize ' . ((&columns * 114 + 114) / 228)
tabnext
edit ~/Documents/payda/paydabackend/kuat.py
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 578 - ((46 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 578
normal! 0
lcd ~/Documents/payda/paydabackend
tabnext
edit ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 113 + 114) / 228)
exe '2resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 113 + 114) / 228)
exe '3resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 3resize ' . ((&columns * 114 + 114) / 228)
exe '4resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 4resize ' . ((&columns * 114 + 114) / 228)
argglobal
balt ~/.config/nvim/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1771 - ((20 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1771
normal! 025|
lcd ~/Documents/payda/payda-front
wincmd w
argglobal
if bufexists("~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue") | buffer ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue | else | edit ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue
endif
balt ~/.config/nvim/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1962 - ((4 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1962
normal! 017|
lcd ~/Documents/payda/payda-front
wincmd w
argglobal
if bufexists("~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue") | buffer ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue | else | edit ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue
endif
balt ~/Documents/payda/payda-front
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1973 - ((15 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1973
normal! 068|
lcd ~/Documents/payda/payda-front
wincmd w
argglobal
if bufexists("~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue") | buffer ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue | else | edit ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue
endif
balt ~/Documents/payda/payda-front
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1973 - ((9 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1973
let s:c = 75 - ((62 * winwidth(0) + 57) / 114)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 75 . '|'
else
  normal! 075|
endif
lcd ~/Documents/payda/payda-front
wincmd w
exe '1resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 113 + 114) / 228)
exe '2resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 113 + 114) / 228)
exe '3resize ' . ((&lines * 24 + 25) / 51)
exe 'vert 3resize ' . ((&columns * 114 + 114) / 228)
exe '4resize ' . ((&lines * 23 + 25) / 51)
exe 'vert 4resize ' . ((&columns * 114 + 114) / 228)
tabnext 1
set stal=1
badd +1916 ~/Documents/payda/paydabackend/api/views.py
badd +1323 ~/Documents/payda/payda-front/src/components/Archive/ArchiveDetails.vue
badd +139 ~/Documents/payda/paydabackend/api/urls.py
badd +578 ~/Documents/payda/paydabackend/kuat.py
badd +0 ~/Documents/payda/paydabackend/users/views.py
badd +76 ~/.config/nvim/init.lua
badd +1 ~/Documents/payda/payda-front
badd +1 ~/Documents/payda/paydabackend/env/lib/python3.7/site-packages/rest_auth/serializers.py
badd +1 ~/.config/emacs
badd +1 ~/Documents/payda/paydabackend
badd +1 ~/Documents/payda/paydabackend/env/lib/python3.7/site-packages/rest_framework/permissions.py
badd +1 ~/.config/nvim
badd +1 /tmp/script.lua
badd +1 ~/Documents/payda/payda-front/src/components/CreateWorkerPopUp/CreateWorkerPopUp.vue
badd +41761 ~/Documents/payda/paydabackend/ablai.json
badd +307 ~/Documents/payda/paydabackend/users/models.py
badd +441 ~/Documents/payda/paydabackend/payda/templates/payment.html
badd +1 ~/Documents/payda/paydabackend/urls.py
badd +2132 ~/Documents/payda/paydabackend/api/excel.py
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
