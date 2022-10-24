local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }

local cppman = function()
	vim.opt.iskeyword:append(":")

	local keyword = vim.fn.expand("<cword>")
	local command = { cmd = "Man " .. keyword }
	vim.api.nvim_cmd(command, { output = false })

	vim.opt.iskeyword:remove(":")
end

vim.api.nvim_create_user_command("CppMan", cppman, {})

local bufferOptions = {
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
}

local setKeymaps = function()
	keymap("n", "M", ":CppMan<cr>", opts)
	keymap("n", "<leader>ss", ":ClangdSwitchSourceHeader<cr>", opts)
end

local cppGroup = augroup("C++ specific settings", { clear = true })

autocmd("FileType", {
	pattern = "cpp,c",
	callback = function()
		for key, value in pairs(bufferOptions) do
			vim.bo[key] = value
		end
		setKeymaps()
	end,
	group = cppGroup,
})
