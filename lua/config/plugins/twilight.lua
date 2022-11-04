local status_ok, twilight = pcall(require, "twilight")
if not status_ok then
	vim.notify("twilight not found")
	return
end

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>tw", ":Twilight<cr>", opts)

twilight.setup({
	dimming = {
		alpha = 0.3,
		inactive = false,
	},
	context = 10,
	treesitter = true,
	expand = {
		"if_statement",
		"for_statement",
		"method_definition",
		"function_definition",
		"function",
		"method",
		"table",
	},
})
