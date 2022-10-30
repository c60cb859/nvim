local options = {
	colorcolumn = "120",
	cursorcolumn = true,
}

for key, value in pairs(options) do
	vim.wo[key] = value
end
