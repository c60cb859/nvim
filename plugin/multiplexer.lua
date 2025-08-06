local modes = { "n", "i", "v" }

-- Quit
vim.keymap.set(modes, "<A-q>", ":q<cr>", { desc = "Quit" })
vim.keymap.set("t", "<A-q>", "<C-\\><C-n>:q<cr>", { desc = "Quit" })
vim.keymap.set(modes, "<A-Q>", ":qall<cr>", { desc = "Quit All" })
vim.keymap.set("t", "<A-Q>", "<C-\\><C-n>:qall<cr>", { desc = "Quit All" })

-- Terminal split
vim.keymap.set(modes, "<A-t>", ":vsplit | terminal<cr>", { desc = "Open terminal in vertical split" })
vim.keymap.set("t", "<A-t>", "<C-\\><C-n>:vsplit | terminal<cr>", { desc = "Open terminal in vertical split" })
vim.keymap.set(modes, "<A-d>", ":split | terminal<cr>", { desc = "Open terminal in horizontal split" })
vim.keymap.set("t", "<A-d>", "<C-\\><C-n>:split | terminal<cr>", { desc = "Open terminal in horizontal split" })

-- Window
vim.keymap.set(modes, "<A-j>", "<c-w>j", { desc = "Move focus to the window below" })
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { desc = "Move focus to window below when in terminal mode" })
vim.keymap.set(modes, "<A-k>", "<c-w>k", { desc = "Move focus to the window above" })
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { desc = "Move focus to window above when in terminal mode" })
vim.keymap.set(modes, "<A-l>", "<c-w>l", { desc = "Move focus to the window on the right" })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { desc = "Move focus to window right when in terminal mode" })
vim.keymap.set(modes, "<A-h>", "<c-w>h", { desc = "Move focus to the window on the left" })
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { desc = "Move focus to window left when in terminal mode" })

-- Window resize
vim.keymap.set(modes, "<C-A-j>", ":resize -5<cr>", { desc = "Make window lovew" })
vim.keymap.set("t", "<C-A-j>", "<C-\\><C-n>:resize -5<cr>", { desc = "Make window lovew" })
vim.keymap.set(modes, "<C-A-k>", ":resize +5<cr>", { desc = "Make window higher" })
vim.keymap.set("t", "<C-A-k>", "<C-\\><C-n>:resize +5<cr>", { desc = "Make window higher" })
vim.keymap.set(modes, "<C-A-l>", ":vertical resize +5<cr>", { desc = "Make window wider" })
vim.keymap.set("t", "<C-A-l>", "<C-\\><C-n>:vertical resize +5<cr>", { desc = "Make window wider" })
vim.keymap.set(modes, "<C-A-h>", ":vertical resize -5<cr>", { desc = "Make window narrower" })
vim.keymap.set("t", "<C-A-h>", "<C-\\><C-n>:vertical resize -5<cr>", { desc = "Make window narrower" })

-- Tabs
vim.keymap.set(modes, "<A-n>", ":tabnew | terminal<cr>", { desc = "Open new tabed terminal" })
vim.keymap.set("t", "<A-n>", "<C-\\><C-n>:tabnew | terminal<cr>", { desc = "Open new tabed terminal" })
vim.keymap.set(modes, "<A-.>", ":tabnext<cr>", { desc = "Jump to next tab" })
vim.keymap.set("t", "<A-.>", "<C-\\><C-n>:tabnext<cr>", { desc = "Jump to next tab" })
vim.keymap.set(modes, "<A-,>", ":tabprevious<cr>", { desc = "Jump to privious tab" })
vim.keymap.set("t", "<A-,>", "<C-\\><C-n>:tabprevious<cr>", { desc = "Jump to privious tab" })
