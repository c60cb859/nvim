local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer not found!")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim"
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Colorschemes
  --use 'real-99/onedarker.nvim'
  use 'joshdick/onedark.vim'
  use 'sheerun/vim-polyglot'
  -- Obsession
  use 'tpope/vim-obsession'
  -- light powerline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- git plugin
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  -- C++ source header switcher
  use 'derekwyatt/vim-fswitch'
  -- Navigation
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  -- Vim Wiki
  use 'vimwiki/vimwiki'
  -- Taskwarrior
  use 'blindFS/vim-taskwarrior'
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
