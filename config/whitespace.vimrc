" Define BadWhitespace
highlight BadWhitespace ctermbg=red guibg=red

" Flagging Unnecessary Whitespace
au BufRead,BufNewFile * match BadWhitespace /\s\+$/

au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
