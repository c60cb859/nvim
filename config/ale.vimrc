" #############################################################################
" Ale config
" #############################################################################

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
	\ 'python': ['pylint'],
	\ 'vim': ['vint'],
	\ 'cpp': ['clang'],
	\ 'c': ['clang'],
\}
