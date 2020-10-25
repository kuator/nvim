function! s:git_history()
    if exists("b:git_history")
        if b:git_history[0]+10 < localtime()
            return b:git_history[1]
        end
    end

    if exists("b:git_original_file")
        let l:fname = b:git_original_file
    else
        let l:fname = expand("%")
    end
    let l:commits = system('git log --format="%h" --follow '.l:fname)
    let l:hist = split(l:commits, "\n")
    let b:git_history = [localtime(), l:hist]

    return l:hist
endfun

function! s:git_first()
    if &modified
        echo "Save your changes first!"
        return
    end
    let l:history = s:git_history()
    call s:file_at_revision(get(l:history, -1, "HEAD"))
endfun

function! s:git_last()
    if &modified
        echo "Save your changes first!"
        return
    end
    let l:history = s:git_history()
    call s:file_at_revision(get(l:history, 1, "HEAD"))
endfun

function! s:git_info()
    if !exists("b:git_revision_hash") || !exists("b:git_original_file")
        echo "Error 01: Not a file@revision buffer!"
        return
    end
    echo system("git show --no-patch ".b:git_revision_hash)
endfun

function! s:git_next()
    if !exists("b:git_revision_hash") || !exists("b:git_original_file")
        echo "Error 01: Not a file@revision buffer!"
        return
    end
    let l:history = s:git_history()
    let l:idx = index(l:history, b:git_revision_hash)
    if l:idx == -1
        echo "Error 02"
        return
    end
    let l:new_revision = get(l:history, l:idx-1, "LAST")
    if l:new_revision=="LAST"
        echo "Already at latest revision! ".l:new_revision
        return
    else
        call s:file_at_revision(l:new_revision)
    end
endfun

function! s:git_prev()
    if !exists("b:git_revision_hash") || !exists("b:git_original_file")
        let l:new_revision = s:git_history()[0]
    else
        let l:history = s:git_history()
        let l:idx = index(l:history, b:git_revision_hash)
        if l:idx == -1
            echo "Error 03: cannot find revision ".b:git_revision_hash
            return
        end
        let l:new_revision = get(l:history, l:idx+1, "FIRST")
    end
    if l:new_revision=="FIRST"
        echo "Already at earliest revision! ".l:new_revision
        return
    else
        call s:file_at_revision(l:new_revision)
    end
endfun

function! s:file_at_revision(rev)
    let l:pos = getpos(".")
    if exists("b:git_original_file")
        let l:fname = b:git_original_file
        let l:ftail = fnamemodify(b:git_original_file, ":t")
    else
        let l:fname = expand("%:t")
        let l:ftail = expand("%:t")
    end
    let l:ftype = &filetype

    ene!
    set modifiable
    silent exec "file ".l:ftail."@".a:rev
    exec "r!git show ".a:rev.":".l:fname
    1,1del
    let l:pos[0] = bufnr('.')
    call setpos('.', l:pos)
    setl nomodifiable
    setl buftype=nofile
    setl bufhidden=delete
    let &filetype = l:ftype

    let b:git_original_file = l:fname
    let b:git_revision_hash = a:rev
    call s:git_info()
endfun

function! s:git_diff(...)
    if a:0
        diffthis
        split
        call s:file_at_revision(a:1)
        au BufUnload <buffer> diffoff!
        diffthis
    else
        if exists("b:git_revision_hash")
            call s:git_diff(get(s:git_history(), index(s:git_history(), b:git_revision_hash)+1, "NIL"))
        else
            call s:git_diff("HEAD")
        end
    end
endfun

command! GitNext call <sid>git_next()
command! GitPrev call <sid>git_prev()
command! GitFirst call <sid>git_first()
command! GitLast call <sid>git_last()
command! GitInfo call <sid>git_info()
command! -nargs=1 GitCheckout call <sid>file_at_revision(<f-args>)
command! -nargs=? GitCompare call <sid>git_diff(<f-args>)
