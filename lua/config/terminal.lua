-- Exit terminal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-n>", { desc = "Map Esc to exit terminal mode" })
vim.keymap.set("t", "<A-q>", "<C-\\><C-n>:q<cr>", { desc = "Quit" })

-- Terminal split
vim.keymap.set("n", "<A-t>", ":vsplit | terminal<cr>", { desc = "Open terminal in vertical split" })
vim.keymap.set("n", "<A-d>", ":split | terminal<cr>", { desc = "Open terminal in horizontal split" })
vim.keymap.set("t", "<A-t>", "<C-\\><C-n>:vsplit | terminal<cr>", { desc = "Open terminal in vertical split" })
vim.keymap.set("t", "<A-d>", "<C-\\><C-n>:split | terminal<cr>", { desc = "Open terminal in horizontal split" })

-- Window
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { desc = "Move focus to window below when in terminal mode" })
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { desc = "Move focus to window above when in terminal mode" })
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { desc = "Move focus to window right when in terminal mode" })
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { desc = "Move focus to window left when in terminal mode" })

-- Window resize
vim.keymap.set("t", "<C-A-j>", "<C-\\><C-n>:resize -5<cr>", { desc = "Make window lovew" })
vim.keymap.set("t", "<C-A-k>", "<C-\\><C-n>:resize +5<cr>", { desc = "Make window higher" })
vim.keymap.set("t", "<C-A-l>", "<C-\\><C-n>:vertical resize +5<cr>", { desc = "Make window wider" })
vim.keymap.set("t", "<C-A-h>", "<C-\\><C-n>:vertical resize -5<cr>", { desc = "Make window narrower" })

-- Tabs
vim.keymap.set("t", "<A-n>", "<C-\\><C-n>:tabnew<cr>", { desc = "Open new tab" })
vim.keymap.set("t", "<A-.>", "<C-\\><C-n>:tabnext<cr>", { desc = "Jump to next tab" })
vim.keymap.set("t", "<A-,>", "<C-\\><C-n>:tabprevious<cr>", { desc = "Jump to privious tab" })

local terminal_buf = nil

local function toggle_terminal()
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    local wins = vim.fn.win_findbuf(terminal_buf)
    if #wins > 0 then
      -- Close all windows showing this buffer
      for _, win in ipairs(wins) do
        vim.api.nvim_win_close(win, false)
      end
    else
      -- Show the terminal
      vim.cmd.split()
      vim.api.nvim_win_set_buf(0, terminal_buf)
      vim.cmd.wincmd("K")
      vim.api.nvim_win_set_height(0, 15)
    end
  else
    -- Create new terminal
    vim.cmd.split()
    vim.cmd.term()
    vim.cmd.wincmd("K")
    vim.api.nvim_win_set_height(0, 15)
    terminal_buf = vim.api.nvim_get_current_buf()
  end
end

-- Normal mode
vim.keymap.set("n", "<A-s>", toggle_terminal)

-- Terminal mode - exit terminal mode first, then toggle
vim.keymap.set("t", "<A-s>", function()
  vim.cmd("stopinsert")
  toggle_terminal()
end)

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Start insert mode then entering a terminal buffer',
  group = vim.api.nvim_create_augroup('term-enter', { clear = true }),
  pattern = "term://*",
  command = "startinsert"
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.spell = false

    vim.cmd("startinsert")
  end
})
