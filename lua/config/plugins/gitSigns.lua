local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	vim.notify("GitSigns not found!")
	return
end

-- GitSigns keymap
local on_attach = function(bufnr)
	local gs = package.loaded.gitsigns
	local opts = { noremap = true, silent = true, buffer = bufnr }
	local keymap = vim.keymap.set

	keymap("n", "<leader>gs", gs.stage_hunk, opts)
	keymap("n", "<leader>gr", gs.reset_hunk, opts)
	keymap("n", "<leader>gu", gs.undo_stage_hunk, opts)
	keymap("n", "<leader>gS", gs.stage_buffer, opts)
	keymap("n", "<leader>gR", gs.reset_buffer, opts)
	keymap("n", "<leader>gp", gs.preview_hunk, opts)
	keymap("n", "g.", gs.next_hunk, opts)
	keymap("n", "g,", gs.prev_hunk, opts)
end

gitsigns.setup({
	on_attach = on_attach,
	signcolumn = false,
	numhl = true,
	linehl = false,
	word_diff = false,
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 1500,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = "          <author>, <author_time> [<abbrev_sha>]",
	current_line_blame_formatter_opts = {
		relative_time = true,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "none",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})
