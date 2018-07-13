" #############################################################################
" Split window
" #############################################################################

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <A-J> :exe "resize +2"<Return>
nnoremap <A-K> :exe "resize -2"<Return>
nnoremap <A-L> :exe "vertical resize +2"<Return>
nnoremap <A-H> :exe "vertical resize -2"<Return>

" #############################################################################
" Visual-line navigation, nice when lines a wrapped
" #############################################################################

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> <Up> gk
noremap <silent> <Down> gj

