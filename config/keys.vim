" #############################################################################
" Leader key set to space
" #############################################################################

let mapleader = " "
let maplocalleader = "\\"

" #############################################################################
" Vim config
" #############################################################################

" Open vim config in split: (e)dit (v)im
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vim config: (s)ource (v)im
nnoremap <leader>sv :source $MYVIMRC<cr>

" #############################################################################
" File handling
" #############################################################################

" Close file ctrl+q
nnoremap <c-q> :q<cr>
" save file ctrl+s
nnoremap <c-s> :w<cr>
" Open file ctrl+o
nnoremap <c-o> :FzfFiles<cr>

" Save file with sudo
cnoremap w! w !sudo tee % >/dev/null

" #############################################################################
" Movement
" #############################################################################

" jump to start off line
" nnoremap H 0
" nnoremap 0 <nop>
" jump to end off line
" nnoremap L $
" nnoremap $ <nop>

" #############################################################################
" Tabs
" #############################################################################


" #############################################################################
" Split window
" #############################################################################

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" #############################################################################
" Misc
" #############################################################################

" Remap insert mode esc to jk
inoremap jk <esc>
inoremap <esc> <nop>
