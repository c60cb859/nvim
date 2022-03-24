local options = {
  autoindent = true,
  backup = false,
  clipboard = "unnamedplus",
  cursorline = true,
  expandtab = true,
  fileencoding = "utf-8",
  foldclose = "all",
  foldcolumn = "0",
  ignorecase = true,
  number = true,
  numberwidth = 1,
  relativenumber = true,
  shiftwidth = 2,
  smartcase = true,
  smartindent = true,
  spell = true,
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
