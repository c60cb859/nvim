local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Turn on spell checking for filetypes
local spellChecking = augroup("Enable spellchecking", { clear = true })
autocmd("Filetype", {
  pattern = "gitcommit,markdown,vimwiki,NeogitCommitMessage",
  command = "setlocal spell",
  group = spellChecking,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when ynaking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
