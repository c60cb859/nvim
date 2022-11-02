local status_ok, dap = pcall(require, "dap")
if not status_ok then
	vim.notify("dap not found")
	return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- stylua: ignore start
keymap("n", "<localleader>c", function() dap.continue() end, opts)
keymap("n", "<localleader>f", function() dap.step_out() end, opts)
keymap("n", "<localleader>s", function() dap.step_into() end, opts)
keymap("n", "<localleader>n", function() dap.step_over() end, opts)
keymap("n", "<localleader>b", function() dap.toggle_breakpoint() end, opts)
-- stylua: ignore end

--[[
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
--]]
