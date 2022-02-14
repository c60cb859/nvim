local options = {
  backup = false,
  swapfile = false,
  undofile = true,
  number = true,
  relativenumber = true,
  numberwidth = 1,
  cursorline = true,
  clipboard = "unnamedplus",
  fileencoding = "utf-8",
  ignorecase = true,
  smartcase = true,
  autoindent = true,
  smartindent = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  splitbelow = true,
  splitright = true,
  updatetime = 300,
  writebackup = false,
  wrap = true,
  foldcolumn = "0",
  foldclose = "all",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
