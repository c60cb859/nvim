-- Lua options
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = false

-- Lua hacks
vim.keymap.set("n", "<localleader><localleader>x", "<cmd>source %<CR>", { desc = "Source the current file" })
vim.keymap.set("n", "<localleader>x", ":.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("v", "<localleader>x", ":lua<CR>", { desc = "Execute the selection" })
