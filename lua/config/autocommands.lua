-- Comment for different filetypes
vim.cmd [[
  augroup filetypeComments
    autocmd!
    autocmd Filetype vim nnoremap <buffer> <leader>c I" <esc>
    autocmd Filetype lua nnoremap <buffer> <leader>c I-- <esc>
    autocmd Filetype python nnoremap <buffer> <leader>c I# <esc>
    autocmd Filetype cpp nnoremap <buffer> <leader>c I// <esc>
  augroup end
]]

-- Whitespace settings for diffrent filetypes
vim.cmd [[
  augroup filetypeSettings
    autocmd!
    autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  augroup end
]]

-- Turn on spell checking for filetypes
vim.cmd [[
  augroup spellCheckingEnabled
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd FileType vimwiki setlocal spell
  augroup end
]]

-- Bad whitespace highlighting
vim.cmd [[
  augroup badwhitespace
    autocmd!
    " Define BadWhitespace
    autocmd Colorscheme * highlight BadWhitespace ctermbg=red guibg=red
    " Flagging Unnecessary Whitespace
    autocmd BufRead,BufNewFile * match BadWhitespace /\s\+$/
    " au BufRead,BufNewFile *.py,*.c,*.cc,*.cpp,*.h,*.hpp match BadWhitespace /^\t\+/
    autocmd Filetype python,cpp,c,cmake match BadWhitespace /^\t\+/
  augroup end
]]

-- Auto insert mode when switching to terminal
vim.cmd [[
  augroup terminalSettings
    autocmd!
    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
  augroup end
]]

-- C++ man pages
vim.cmd [[
  function! s:CppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
  endfunction
  command! CppMan :call s:CppMan()

  au FileType cpp nnoremap <buffer>M :CppMan<CR>
]]
