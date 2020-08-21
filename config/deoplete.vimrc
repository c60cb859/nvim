" #############################################################################
" Deoplete config
" #############################################################################

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})
" maximum candidate window length
"call deoplete#custom#source('_', 'max_menu_width', 80)

" Auto close preview windows
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Auto complete with tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" #############################################################################
" Deoplete-clang config
" #############################################################################

" let g:deoplete#sources#clang#libclang_path="/usr/lib/llvm-7/lib/libclang.so"
" let g:deoplete#sources#clang#clang_header="/usr/lib/llvm-7/include/clang" 

" #############################################################################
" Deoplete-jedi config
" #############################################################################
