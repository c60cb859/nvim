" #############################################################################
" Filetype comments
" #############################################################################

augroup filetypeComments
	autocmd!
	autocmd Filetype vim nnoremap <buffer> <localleader>c I" <esc>
	autocmd Filetype python nnoremap <buffer> <localleader>c I# <esc>
	autocmd Filetype cpp nnoremap <buffer> <localleader>c I// <esc>
augroup END

" #############################################################################
" Filetype settings
" #############################################################################

augroup filetypeSettings
	autocmd!
	autocmd Filetype python setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=120 fileformat=unix
	autocmd Filetype cpp setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=120 fileformat=unix
augroup END
