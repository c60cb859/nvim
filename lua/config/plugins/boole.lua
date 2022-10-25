local status_ok, boole = pcall(require, "boole")
if not status_ok then
	vim.notify("boole not found")
	return
end

boole.setup({
	mappings = {
		increment = "<C-a>",
		decrement = "<C-x>",
	},
	-- User defined loops
	additions = {
		{ "TRUE", "FALSE" },
		{ "ON", "OFF" },
		{ "get", "set" },
		{ "Get", "Set" },
	},
})
