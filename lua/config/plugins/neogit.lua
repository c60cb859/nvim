local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
	vim.notify("neogit not found")
	return
end

neogit.setup({
	disable_signs = false,
	disable_hint = false,
	disable_context_highlighting = false,
	disable_commit_confirmation = false,
	auto_refresh = true,
	disable_builtin_notifications = false,
	use_magit_keybindings = true,
	kind = "vsplit",
	commit_popup = {
		kind = "split",
	},
	popup = {
		kind = "split",
	},
	signs = {
		section = { "", "" },
		item = { "", "" },
		hunk = { "", "" },
	},
	integrations = {
		diffview = true,
	},
})

local openNeogit = function()
	neogit.open()
end

vim.keymap.set("n", "<leader>gg", openNeogit, { noremap = true, silent = true })
