" #############################################################################
" C++ ref manual cppman
" #############################################################################

function! s:CppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! CppMan :call s:CppMan()

au FileType cpp nnoremap <buffer>K :CppMan<CR>
