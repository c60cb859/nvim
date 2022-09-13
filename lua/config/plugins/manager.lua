local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the manager.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost manager.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify('Packer not found!')
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Lua helper plugin
  use 'nvim-lua/plenary.nvim'

  -- Colorschemes
  use 'joshdick/onedark.vim'
  use 'sheerun/vim-polyglot'

  -- Obsession
  use 'tpope/vim-obsession'

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = false }
  }
  -- git plugin
  use 'lewis6991/gitsigns.nvim'

  -- Navigation
  use 'ibhagwan/fzf-lua'

  -- Vim Wiki
  use {'vimwiki/vimwiki', branch = 'dev'}

  -- Taskwarrior
  use 'blindFS/vim-taskwarrior'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Auto Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'hrsh7th/cmp-nvim-lsp'

  -- Lua Completion
  use 'hrsh7th/cmp-nvim-lua'

  -- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- Yocto bitbake syntax
  use 'kergoth/vim-bitbake'

  -- Diagrams
  use 'jbyuki/venn.nvim'

  -- bufMov
  --use '/home/theis/git/bufMov'
  use 'c60cb859/bufMov.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  -- Spelling syntax highlight
  use 'lewis6991/spellsitter.nvim'
  -- Formatter (rust)
  --use 'Chiel92/vim-autoformat'
  use 'vim-autoformat/vim-autoformat'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
