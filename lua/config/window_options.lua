local options = {
	-- colorcolumn = "120",
	-- cursorcolumn = true,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldenable = false,
}

for key, value in pairs(options) do
	vim.wo[key] = value
end
