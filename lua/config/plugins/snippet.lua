local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("luasnip not found!")
	return
end

ls.setup({
	enable_autosnippets = false,
})

require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip/loaders/from_lua").lazy_load()

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, opts)

keymap({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, opts)

keymap({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice()
	end
end, opts)
