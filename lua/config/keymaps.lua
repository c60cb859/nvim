local opts = { noremap = true, silent = true }
local termOpts = { silent = true }

-- Short keymap function
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<space>", "<nop>", opts)
keymap("", "<bs>", "<nop>", opts)
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

-- All modes --
-- Visual-line navigation, nice when lines a wrapped
keymap("", "k", "gk", opts)
keymap("", "j", "gj", opts)

-- Normal mode --
-- Disable keys
keymap("n", "Q", "", opts)

-- Quite, save and open shotcuts
keymap("n", "<c-q>", ":q<cr>", opts)
keymap("n", "<c-s>", ":w<cr>", opts)

-- QuickFix movements
keymap("n", "C>", ":cnext<cr>", opts)
keymap("n", "C<", ":cNext<cr>", opts)

-- Center after half page jump
keymap("n", "<c-d>", "<c-d>zz", opts)
keymap("n", "<c-u>", "<c-u>zz", opts)

-- Tabs
keymap("n", "<c-t>", ":tabnew<cr>", opts)
keymap("n", "<c-l>", ":tabnext<cr>", opts)
keymap("n", "<c-h>", ":tabprevious<cr>", opts)

-- BufMov
keymap("n", "<leader>j", ":MoveBufferDown<cr>", opts)
keymap("n", "<leader>k", ":MoveBufferUp<cr>", opts)
keymap("n", "<leader>l", ":MoveBufferRight<cr>", opts)
keymap("n", "<leader>h", ":MoveBufferLeft<cr>", opts)

-- Remove bad whitespaces
keymap("n", "<leader>rs", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>", opts)

-- Insert mode --
keymap("i", "<c-c>", "<esc>", opts)

-- Visual mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep copy buffer on paste
keymap("v", "<leader>p", '"_dP', opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<cr>gv-gv", opts)
keymap("v", "K", ":move '<-2<cr>gv-gv", opts)

-- Terminal mode --
keymap("t", "<esc>", "<c-\\><c-n>", termOpts)
