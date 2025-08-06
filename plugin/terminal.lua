-- Exit terminal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Map Esc to exit terminal mode" })

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Start insert mode then entering a terminal buffer",
  group = vim.api.nvim_create_augroup("term-enter", { clear = true }),
  pattern = "term://*",
  command = "startinsert",
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.spell = false

    vim.cmd("startinsert")
  end,
})
