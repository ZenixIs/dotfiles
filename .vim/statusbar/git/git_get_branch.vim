" A simple function that returns
" the current git branch or an
" empty string if there is no
" .git directory available
"
function! GetGitBranch()
    try
        let l:file = readfile(getcwd() . "/.git/HEAD", '')
        for l:line in l:file
            let l:branch = l:line
        endfor
        return split(l:branch, '/')[2]
    catch /E484/
        return ''
    endtry
endfunction
