local buf = vim.bo

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


local filetypeGroup = augroup('Filetype detection', { clear = true })

autocmd('BufRead,BufNewFile', { pattern = '*.asm', command = 'set filetype=asm', group = filetypeGroup })
autocmd('BufRead,BufNewFile', { pattern = '*.nasm', command = 'set filetype=nasm', group = filetypeGroup })
autocmd('BufRead,BufNewFile', { pattern = '*.fasm', command = 'set filetype=fasm', group = filetypeGroup })
autocmd('BufRead,BufNewFile', { pattern = '*.masm', command = 'set filetype=masm', group = filetypeGroup })


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

-- Turn on spell checking for filetypes
local spellChecking = augroup('Enable spellchecking', { clear = true })

autocmd('Filetype', {
  pattern = 'gitcommit,markdown,vimwiki',
  command = 'setlocal spell',
  group = spellChecking
})


-- Bad whitespace highlighting
--local badwhitespace = augroup('Highlight bad whitespacer', { clear = true })
--autocmd('BufRead,BufNewFile', {
--    callback = function()
--    end,
--    match = 'BadWhitespace \s\+$',
--    group = badwhitespace
--  })

vim.cmd [[
augroup badwhitespace
autocmd!
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

-- Formatter
local formatter = augroup('Auto format code', { clear = true })

autocmd('BufWritePre', {
  pattern = '*.rs,*.lua',
  command = 'Autoformat',
  group = formatter
})
