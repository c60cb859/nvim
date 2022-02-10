" #############################################################################
" Mark badwhitespace
" #############################################################################

augroup badwhitespace
	autocmd!
	" Define BadWhitespace
	autocmd Colorscheme * highlight BadWhitespace ctermbg=red guibg=red
	" Flagging Unnecessary Whitespace
	autocmd BufRead,BufNewFile * match BadWhitespace /\s\+$/
	" au BufRead,BufNewFile *.py,*.c,*.cc,*.cpp,*.h,*.hpp match BadWhitespace /^\t\+/
	autocmd Filetype python,cpp,c match BadWhitespace /^\t\+/
augroup END

" #############################################################################
" Remove badwhitespace on save
" #############################################################################

autocmd BufWritePre * :%s/\s\+$//e
