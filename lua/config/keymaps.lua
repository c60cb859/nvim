local opts = { noremap = true, silent = true }
local termOpts = { silent = true }

-- Short keymap function
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<space>", "<nop>", opts)
keymap("", ";", "<nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Modes
--   all         = "",
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

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

-- Move between split windows
keymap("n", "<localleader>j", "<c-w><c-j>", opts)
keymap("n", "<localleader>k", "<c-w><c-k>", opts)
keymap("n", "<localleader>l", "<c-w><c-l>", opts)
keymap("n", "<localleader>h", "<c-w><c-h>", opts)

-- BufMov
keymap("n", "<leader>j", ":MoveBufferDown<cr>", opts)
keymap("n", "<leader>k", ":MoveBufferUp<cr>", opts)
keymap("n", "<leader>l", ":MoveBufferRight<cr>", opts)
keymap("n", "<leader>h", ":MoveBufferLeft<cr>", opts)

-- Remove bad whitespaces
keymap("n", "<leader>rs", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>", opts)

-- Insert mode --

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
