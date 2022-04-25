local buf = vim.bo

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


local filetypeGroup = augroup('Filetype detection', { clear = true })

autocmd('BufRead,BufNewFile', { pattern = '*.asm', callback = function() buf.filetype = 'asm' end, group = filetypeGroup })
autocmd('BufRead,BufNewFile', { pattern = '*.nasm', callback = function() buf.filetype = 'nasm' end, group = filetypeGroup })
autocmd('BufRead,BufNewFile', { pattern = '*.fasm', callback = function() buf.filetype = 'fasm' end, group = filetypeGroup })
autocmd('BufRead,BufNewFile', { pattern = '*.masm', callback = function() buf.filetype = 'masm' end, group = filetypeGroup })


local whitespaceGroup = augroup('Whitespace settings', { clear = true })

autocmd('Filetype', {
    pattern = 'python',
    callback = function()
      buf.tabstop = 4
      buf.softtabstop = 4
      buf.shiftwidth = 4
    end,
    group = whitespaceGroup
  })

--local spellChecking = augroup('Enable spellchecking', { clear = true })
--autocmd('Filetype', { pattern = 'gitcommit,markdown,vimwiki', callback = function() vim.bo.spell = true end, group = spellChecking })

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

-- cgasm
vim.cmd [[
  function! s:Cgasm()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute '!cgasm ' . str
  endfunction
  command! Cgasm :call s:Cgasm()

  au FileType asm,nasm,fasm nnoremap <buffer>M :Cgasm<CR>
]]
