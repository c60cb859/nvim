local opts = { noremap = true, silent = true }
--local termOpts = { silent = true }

-- Short keymap function
local keymap = vim.api.nvim_set_keymap

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
-- FZF keymaps
keymap("n", "<leader>o", "<cmd>lua require('fzf-lua').files()<cr>", opts)
keymap("n", "<leader>i", "<cmd>lua require('fzf-lua').buffers()<cr>", opts)
keymap("n", "<leader>p", "<cmd>lua require('fzf-lua').grep_project()<cr>", opts)
keymap("n", "z=", "<cmd>lua require('fzf-lua').spell_suggest()<cr>", opts)
-- Move between split windows
keymap("n", "<c-j>", "<c-w><c-j>", opts)
keymap("n", "<c-k>", "<c-w><c-k>", opts)
keymap("n", "<c-l>", "<c-w><c-l>", opts)
keymap("n", "<c-h>", "<c-w><c-h>", opts)
-- Remove bad whitespaces
keymap("n", "<leader>rs", ":let _s=@/ <Bar> :%s/\\s\\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>", opts)
-- C/C++ switch between header and source keymap
keymap("n", "<leader>ss", ":ClangdSwitchSourceHeader<cr>", opts)

-- Insert mode --
-- Remap insert exit to jk
keymap("i", "jk", "<esc>", opts)
keymap("i", "<esc>", "<nop>", opts)

-- Visual mode --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- Keep copy buffer on paste
keymap("v", "p", '"_dP', opts)
-- Move text up and down
keymap("v", "J", ":move '>+1<cr>gv-gv", opts)
keymap("v", "K", ":move '<-2<cr>gv-gv", opts)

-- Terminal mode --
-- Remap terminal exit to jk
--keymap("t", "<esc>", "<c-\\><c-n>", termOpts)

