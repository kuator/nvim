command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
