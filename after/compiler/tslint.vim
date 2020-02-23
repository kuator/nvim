let current_compiler = "tslint"
let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=tslint\ $*\ -t\ prose\ -c\ tslint.json\ -p\ tsconfig.json
" CompilerSet errorformat=\%EERROR:\ %f[%l\\\,\ %c]:\ %m,\%WWARNING:\ %f[%l\\\,\ %c]:\ %m,\%E%f[%l\\\,\ %c]:\ %m
CompilerSet errorformat=\%-G,\%EERROR:\ %f:%l:%c\ -\ %m,\%WWARNING:\ %f:%l:%c\ -\ %m,\%EERROR:\ %f[%l\,\ %c]:\ %m,\ %WWARNING:\ %f[%l\,\ %c]:\ %m
let &cpo = s:cpo_save
unlet s:cpo_save
