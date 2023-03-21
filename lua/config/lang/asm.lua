local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }

local cgasm = function()
	local keyword = vim.fn.expand("<cword>")
	local command = "!cgasm " .. keyword
	vim.cmd(command)
end

vim.api.nvim_create_user_command("Cgasm", cgasm, {})

local bufferOptions = {
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
}

local setKeymaps = function()
	--keymap("n", "M", ":Cgasm<cr>", opts)
	keymap("n", "M", function()
		local keyword = vim.fn.expand("<cword>")
		local cmd = "cgasm " .. keyword
		require("whid").float_cmd(cmd)
	end, opts)
end

local filetypeGroup = augroup("Filetype detection", { clear = true })
autocmd("BufRead,BufNewFile", { pattern = "*.asm", command = "set filetype=asm", group = filetypeGroup })
autocmd("BufRead,BufNewFile", { pattern = "*.nasm", command = "set filetype=nasm", group = filetypeGroup })
autocmd("BufRead,BufNewFile", { pattern = "*.fasm", command = "set filetype=fasm", group = filetypeGroup })
autocmd("BufRead,BufNewFile", { pattern = "*.masm", command = "set filetype=masm", group = filetypeGroup })

local asmGroup = augroup("Assembly specific settings", { clear = true })

autocmd("FileType", {
	pattern = "asm,nasm,fasm,masm,rizin",
	callback = function()
		for key, value in pairs(bufferOptions) do
			vim.bo[key] = value
		end
		setKeymaps()
	end,
	group = asmGroup,
})
