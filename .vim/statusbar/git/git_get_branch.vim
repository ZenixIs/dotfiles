" A simple function that returns
" the current git branch or an
" empty string if there is no
" .git directory available
"

function! GetGitBranch()
    let cwd = getcwd()
    let file = "/.git/HEAD"
    let branch = ''

    " Trying to get the current
    " branch if there's a repo
    if filereadable(cwd . file)
        let branch = ReturnBranchFromFile(cwd, file)
    elseif filereadable(expand("%:h") . file)
        let branch = ReturnBranchFromFile(expand("%:h"), file)
    endif

    return branch
endfunction

function! ReturnBranchFromFile(path, file)
    let read = readfile(a:path . a:file)

    for line in read
       let str = line
    endfor

    return split(str, '/')[2]
endfunction
