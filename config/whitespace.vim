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
	autocmd Filetype python,cpp,c,cmake match BadWhitespace /^\t\+/
augroup END

" #############################################################################
" Remove badwhitespace
" #############################################################################

" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
