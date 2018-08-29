function! ale_linters#b#bcwrap#HandleBcwrapFormat(buffer, lines) abort
    let l:output = []
    " errorformat '%f:%l:%c: %m'
    let l:pattern = '\v^([^:]+):(\d+):(\d+): (.+)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        let l:type = 'E'
        call add(l:output, {
        \   'filename': l:match[1],
        \   'lnum': l:match[2] + 0,
        \   'col': l:match[3] + 0,
        \   'text': l:match[4],
        \   'type': l:type,
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('b', {
			\   'name': 'bcwrap',
			\   'executable': 'bcwrap',
			\   'command': 'bcwrap %s',
			\   'callback': 'ale_linters#b#bcwrap#HandleBcwrapFormat',
			\})
