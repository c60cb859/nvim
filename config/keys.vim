" #############################################################################
" Split window
" #############################################################################

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-S-I> <C-W>v
nnoremap <C-_> <C-W>s

"nnoremap <C-S-J> :exe "resize +2"<Return>
"nnoremap <C-S-K> :exe "resize -2"<Return>
"nnoremap <C-S-L> :exe "vertical resize +2"<Return>
"nnoremap <C-S-H> :exe "vertical resize -2"<Return>

" #############################################################################
" Visual-line navigation, nice when lines a wrapped
" #############################################################################

noremap <silent> k gk
noremap <silent> j gj
noremap <silent> <Up> gk
noremap <silent> <Down> gj

