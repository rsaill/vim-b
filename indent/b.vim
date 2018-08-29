" Vim indent file
" Language:     B
" Maintainers:  Ronan Saillard

" Only load this indent file when no other was loaded yet.
if exists("b:did_indent")
	finish
endif

let b:did_indent = 1

setlocal expandtab
setlocal shiftwidth=4
setlocal indentexpr=GetBIndent()
"setlocal indentkeys+=0=THEN,0=REFINES,0=OPERATIONS,0=INITIALISATION,0=INVARIANT,0=ABSTRACT_VARIABLES,0=DEFINITIONS,0=SEES,0=WHERE,0=ELSE,0=IMPORTS,0=LOCAL_OPERATIONS,0=IN,0=INCLUDES,0=CONSTRAINTS,0=CONSTANTS,0=VARIABLES,0=CONCRETE_CONSTANTS,0=CONCRETE_VARIABLES,0=ABSTRACT_CONSTANTS,0=HIDDEN_CONSTANTS,0=HIDDEN_VARIABLES,0=ASSERTIONS,0=EXTENDS,0=USES,0=PROMOTES,0=PROPERTIES,0=SETS,0=VALUES,0=VARIANT,0=VISIBLE_CONSTANTS,0=VISIBLE_VARIABLES,0=IN,0=OR,0=ELSIF,0=WHEN,0=OF,0=DO,0=END
"setlocal indentkeys+=0=END


" Only define the function once.
if exists("*GetBIndent")
	finish
endif

let s:start_kw = '\<MACHINE\>\|\<REFINEMENT\>\|\<IMPLEMENTATION\>\|\<PRE\>\|\<IF\>\|\<ANY\>\|\<VAR\>\|\<BEGIN\>\|\<CASE\>\|\<EITHER\>\|\<CHOICE\>\|\<ASSERT\>\|\<SELECT\>\|\<WHILE\>\|(\|{\|\['
let s:middle_kw = '\<THEN\>\|\<REFINES\>\|\<OPERATIONS\>\|\<INITIALISATION\>\|\<INVARIANT\>\|\<ABSTRACT_VARIABLES\>\|\<DEFINITIONS\>\|\<SEES\>\|\<WHERE\>\|\<ELSE\>\|\<IMPORTS\>\|\<LOCAL_OPERATIONS\>\|\<IN\>\|\<INCLUDES\>\|\<CONSTRAINTS\>\|\<CONSTANTS\>\|\<VARIABLES\>\|\<CONCRETE_CONSTANTS\>\|\<CONCRETE_VARIABLES\>\|\<ABSTRACT_CONSTANTS\>\|\<HIDDEN_CONSTANTS\>\|\<HIDDEN_VARIABLES\>\|\<ASSERTIONS\>\|\<EXTENDS\>\|\<USES\>\|\<PROMOTES\>\|\<PROPERTIES\>\|\<SETS\>\|\<VALUES\>\|\<VARIANT\>\|\<VISIBLE_CONSTANTS\>\|\<VISIBLE_VARIABLES\>\|\<IN\>\|\<OR\>\|\<ELSIF\>\|\<WHEN\>\|\<OF\>\|\<DO\>'
let s:end_kw = '\<END\>\|)\|}\|\]' 
let s:skip ='synIDattr(synID(line("."), col("."), 0), "name") ' . '=~? "string\\|comment"'

function! GetLineWithoutBlockComments(lnum)
	return substitute(getline(a:lnum), '(\*.*\*)\s*$', '', '')
endfunction

function! GetBIndent()
	" First line of the file
	if v:lnum <= 1
		return 0
	endif 

	let [ln,cn] = searchpairpos(s:start_kw,s:middle_kw,s:end_kw,'bW',s:skip)
	if ln > 0
		let current_line = GetLineWithoutBlockComments(v:lnum)
		if ( current_line =~? '^\s*\(' . s:middle_kw . '\|' . s:end_kw . '\)' )
			" Line begining with an intermediate or block ending keyword
			return indent(ln)
		else
			" Otherwise
			return indent(ln) + shiftwidth()
		endif
	endif
	return 0
endfunction
