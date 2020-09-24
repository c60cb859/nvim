" Define BadWhitespace
au Colorscheme * highlight BadWhitespace ctermbg=red guibg=red

" Flagging Unnecessary Whitespace
au BufRead,BufNewFile * match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.c,*.cc,*.cpp,*.h,*.hpp match BadWhitespace /^\t\+/
