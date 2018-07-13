" #############################################################################
" Python
" #############################################################################

au BufNewFile,BufRead *.py:
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=120
	\ set expandtab
	\ set fileformat=unix

let python_highlight_all=1
