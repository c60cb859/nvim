local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local bufferOptions = {
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
}

local rustGroup = augroup("rust specific settings", { clear = true })

autocmd("FileType", {
	pattern = "rust",
	callback = function()
		for key, value in pairs(bufferOptions) do
			vim.bo[key] = value
		end
	end,
	group = rustGroup,
})
