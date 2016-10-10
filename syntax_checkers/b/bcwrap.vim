if exists('g:loaded_syntastic_b_checker')
    finish
endif
let g:loaded_syntastic_b_checker = 1

function! SyntaxCheckers_b_bcwrap_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'exe': 'bcwrap' })
    let errorformat = '%f:%l:%c: %m'
    return SyntasticMake( { 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker( { 'filetype': 'b', 'name': 'bcwrap' } )
