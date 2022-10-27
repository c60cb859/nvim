local listchars = {
	eol = "",
	tab = "⊦ ",
	multispace = "␣",
	lead = " ",
	trail = "",
}

local options = {
	autoindent = true,
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 0,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	foldclose = "all",
	foldcolumn = "0",
	ignorecase = true,
	laststatus = 3,
	list = true,
	listchars = listchars,
	matchpairs = "(:),{:},[:],<:>",
	number = true,
	numberwidth = 1,
	relativenumber = true,
	shiftwidth = 2,
	showtabline = 0,
	signcolumn = "number",
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	undofile = true,
	updatetime = 300,
	wrap = true,
	writebackup = false,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
