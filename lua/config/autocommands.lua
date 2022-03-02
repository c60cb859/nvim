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
    autocmd Filetype python setl tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=120 fileformat=unix
    autocmd Filetype cpp setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=120 fileformat=unix
    autocmd Filetype c setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=120 fileformat=unix
    autocmd Filetype cmake setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=120 fileformat=unix
    autocmd Filetype xml setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=120 fileformat=unix
    autocmd Filetype lua setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=120 fileformat=unix
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

  au FileType cpp nnoremap <buffer>K :CppMan<CR>
]]
