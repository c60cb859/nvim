-- Remap space as leader key
vim.keymap.set("", "<space>", "<nop>", { desc = "Set space to no operation" })
vim.keymap.set("", "<bs>", "<nop>", { desc = "Set backspace to no operation" })

-- Modes
-- 	all					= "",
-- 	normal_mode			= "n",
-- 	insert_mode			= "i",
-- 	visual_mode			= "v",
-- 	visual_block_mode	= "x",
-- 	term_mode			= "t",
-- 	command_mode		= "c"

-- Visual-line navigation, nice when lines a wrapped
vim.keymap.set("", "k", "gk", { desc = "Move up one visual line" })
vim.keymap.set("", "j", "gj", { desc = "Move down one visual line" })

-- Lua hacks
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source the current file" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Execute the selection" })

-- vim.keymap.set("n", "<c-s>", ":w<cr>", { desc = "" })

-- QuickFix movements
-- vim.keymap.set("n", "C>", ":cnext<cr>", { desc = "Jump to the next quickfix item" })
-- vim.keymap.set("n", "C<", ":cNext<cr>", { desc = "Jump to the previous quickfix item" })

-- Center after half page jump
vim.keymap.set("n", "<C-d>", "<c-d>zz", { desc = "Center after half page down jumps" })
vim.keymap.set("n", "<C-u>", "<c-u>zz", { desc = "Center after half page up jumps" })

-- -- BufMov
-- vim.keymap.set("n", "<leader>j", ":MoveBufferDown<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>k", ":MoveBufferUp<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>l", ":MoveBufferRight<cr>", { desc = "" })
-- vim.keymap.set("n", "<leader>h", ":MoveBufferLeft<cr>", { desc = "" })

-- Remove bad whitespaces
-- vim.keymap.set("n", "<leader>rs", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>", { desc = "" })

vim.keymap.set("i", "<C-c>", "<esc>", { desc = "Exit from insert mode" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Stay in indent mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Stay in indent mode" })

-- Keep copy buffer on paste
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Keep copy buffer on paste" })

-- Move text up and down
vim.keymap.set("v", "J", ":move '>+1<cr>gv-gv", { desc = "Move selected text up" })
vim.keymap.set("v", "K", ":move '<-2<cr>gv-gv", { desc = "Move selected text down" })
