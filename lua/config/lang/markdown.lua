local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local bufferOptions = {
	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,
}

local markdownGroup = augroup("markdown specific settings", { clear = true })

autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		for key, value in pairs(bufferOptions) do
			vim.bo[key] = value
		end
	end,
	group = markdownGroup,
})
