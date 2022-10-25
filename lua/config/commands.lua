local toggleMap = {
	["True"] = "False",
	["False"] = "True",
	["true"] = "false",
	["false"] = "true",
	["TRUE"] = "FALSE",
	["FALSE"] = "TRUE",
}

local toggleBool = function()
	local keyword = vim.fn.expand("<cword>")

	vim.cmd("normal! ciw" .. toggleMap[keyword])
end

vim.api.nvim_create_user_command("ToggleBool", toggleBool, {})
