local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local bufferOptions = {
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
}

local pythonGroup = augroup("Python specific settings", { clear = true })

autocmd("FileType", {
	pattern = "python",
	callback = function()
		for key, value in pairs(bufferOptions) do
			vim.bo[key] = value
		end
	end,
	group = pythonGroup,
})
