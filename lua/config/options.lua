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
  laststatus = 3,
  number = true,
  numberwidth = 1,
  relativenumber = true,
  shiftwidth = 2,
  signcolumn = "number",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  --  textwidth = 120,
  undofile = true,
  updatetime = 300,
  winbar = '%=%m %f',
  wrap = true,
  writebackup = false,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
