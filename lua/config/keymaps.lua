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

-- Quit and save shotcuts
keymap("n", "<m-q>", ":q<cr>", opts)
-- keymap("n", "<c-s>", ":w<cr>", opts)

-- QuickFix movements
keymap("n", "C>", ":cnext<cr>", opts)
keymap("n", "C<", ":cNext<cr>", opts)

-- Center after half page jump
keymap("n", "<c-d>", "<c-d>zz", opts)
keymap("n", "<c-u>", "<c-u>zz", opts)

-- Window
keymap("n", "<M-j>", "<c-w>j", opts)
keymap("n", "<M-k>", "<c-w>k", opts)
keymap("n", "<M-l>", "<c-w>l", opts)
keymap("n", "<M-h>", "<c-w>h", opts)

-- Window resize
keymap("n", "<C-M-j>", ":resize -5<cr>", opts)
keymap("n", "<C-M-k>", ":resize +5<cr>", opts)
keymap("n", "<C-M-l>", ":vertical resize +5<cr>", opts)
keymap("n", "<C-M-h>", ":vertical resize -5<cr>", opts)

-- Tabs
keymap("n", "<M-n>", ":tabnew<cr>", opts)
keymap("n", "<M-.>", ":tabnext<cr>", opts)
keymap("n", "<M-,>", ":tabprevious<cr>", opts)

-- Terminal split
keymap("n", "<M-t>", ":vsplit | terminal<cr> i", opts)
keymap("n", "<M-d>", ":split | terminal<cr> i", opts)

-- -- BufMov
-- keymap("n", "<leader>j", ":MoveBufferDown<cr>", opts)
-- keymap("n", "<leader>k", ":MoveBufferUp<cr>", opts)
-- keymap("n", "<leader>l", ":MoveBufferRight<cr>", opts)
-- keymap("n", "<leader>h", ":MoveBufferLeft<cr>", opts)

-- Remove bad whitespaces
-- keymap("n", "<leader>rs", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>", opts)

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
