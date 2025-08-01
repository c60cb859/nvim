-- Short keymap function
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<space>", "<nop>", { desc = "Set space to no operation" })
keymap("", "<bs>", "<nop>", { desc = "Set backspace to no operation" })

vim.g.mapleader = " "
vim.g.maplocalleader = vim.api.nvim_replace_termcodes("<bs>", true, false, true)

-- Modes
--	all					= "",
--	normal_mode			= "n",
--	insert_mode			= "i",
--	visual_mode			= "v",
--	visual_block_mode	= "x",
--	term_mode			= "t",
--	command_mode		= "c"

-- Visual-line navigation, nice when lines a wrapped
keymap("", "k", "gk", { desc = "Move up one visual line" })
keymap("", "j", "gj", { desc = "Move down one visual line" })

-- Lua hacks
keymap("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source the current file" })
keymap("n", "<space>x", ":.lua<CR>", { desc = "Execute the current line" })
keymap("v", "<space>x", ":lua<CR>", { desc = "Execute the selection" })

-- Quit and save shotcuts
keymap("n", "<A-q>", ":q<cr>", { desc = "Quit" })
-- keymap("n", "<c-s>", ":w<cr>", { desc = "" })

-- QuickFix movements
-- keymap("n", "C>", ":cnext<cr>", { desc = "Jump to the next quickfix item" })
-- keymap("n", "C<", ":cNext<cr>", { desc = "Jump to the previous quickfix item" })

-- Center after half page jump
keymap("n", "<C-d>", "<c-d>zz", { desc = "Center after half page down jumps" })
keymap("n", "<C-u>", "<c-u>zz", { desc = "Center after half page up jumps" })

-- Window
keymap("n", "<A-j>", "<c-w>j", { desc = "Move focus to the window below" })
keymap("n", "<A-k>", "<c-w>k", { desc = "Move focus to the window above" })
keymap("n", "<A-l>", "<c-w>l", { desc = "Move focus to the window on the right" })
keymap("n", "<A-h>", "<c-w>h", { desc = "Move focus to the window on the left" })

-- Window resize
keymap("n", "<C-A-j>", ":resize -5<cr>", { desc = "Make window lovew" })
keymap("n", "<C-A-k>", ":resize +5<cr>", { desc = "Make window higher" })
keymap("n", "<C-A-l>", ":vertical resize +5<cr>", { desc = "Make window wider" })
keymap("n", "<C-A-h>", ":vertical resize -5<cr>", { desc = "Make window narrower" })

-- Tabs
keymap("n", "<A-n>", ":tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<A-.>", ":tabnext<cr>", { desc = "Jump to next tab" })
keymap("n", "<A-,>", ":tabprevious<cr>", { desc = "Jump to privious tab" })


-- -- BufMov
-- keymap("n", "<leader>j", ":MoveBufferDown<cr>", { desc = "" })
-- keymap("n", "<leader>k", ":MoveBufferUp<cr>", { desc = "" })
-- keymap("n", "<leader>l", ":MoveBufferRight<cr>", { desc = "" })
-- keymap("n", "<leader>h", ":MoveBufferLeft<cr>", { desc = "" })

-- Remove bad whitespaces
-- keymap("n", "<leader>rs", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>", { desc = "" })

keymap("i", "<C-c>", "<esc>", { desc = "Exit from insert mode" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Stay in indent mode" })
keymap("v", ">", ">gv", { desc = "Stay in indent mode" })

-- Keep copy buffer on paste
keymap("v", "<leader>p", '"_dP', { desc = "Keep copy buffer on paste" })

-- Move text up and down
keymap("v", "J", ":move '>+1<cr>gv-gv", { desc = "Move selected text up" })
keymap("v", "K", ":move '<-2<cr>gv-gv", { desc = "Move selected text down" })
