local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the manager.lua file
local packer_user_config = vim.api.nvim_create_augroup("Packer config on save", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "manager.lua",
	command = "source <afile> | PackerSync",
	group = packer_user_config,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer not found!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Lua helper plugin
	use("nvim-lua/plenary.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			{ "nvim-lua/plenary.nvim", opt = false },
			{ "kyazdani42/nvim-web-devicons", opt = false },
			{ "nvim-telescope/telescope-fzf-native.nvim", opt = false, run = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim", opt = false },
		},
	})

	-- Colorschemes
	use("navarasu/onedark.nvim")

	-- Obsession
	use("tpope/vim-obsession")

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = false },
	})
	-- Incline
	use("b0o/incline.nvim")

	-- git plugin
	use("lewis6991/gitsigns.nvim")
	use({
		"TimUntersberger/neogit",
		requires = {
			{ "sindrets/diffview.nvim", opt = false },
			{ "nvim-lua/plenary.nvim", opt = false },
		},
	})

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" })
	use("williamboman/mason-lspconfig.nvim")

	-- Auto Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lsp-document-symbol")

	-- Lua Completion for neovim API
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Boole
	use("nat-418/boole.nvim")

	-- autopairs
	use("windwp/nvim-autopairs")

	-- indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- Yocto bitbake syntax
	use("kergoth/vim-bitbake")

	-- bufMov
	--use("/home/theis/git/bufMov")
	use("c60cb859/bufMov.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	local treesitter = { "nvim-treesitter/nvim-treesitter", opt = false }

	use({ "nvim-treesitter/playground", requires = treesitter })
	use({ "nvim-treesitter/nvim-treesitter-context", requires = treesitter })
	use({ "HiPhish/nvim-ts-rainbow2", requires = treesitter })
	use({ "folke/twilight.nvim", requires = treesitter })
	use({ "numToStr/Comment.nvim", requires = treesitter })

	-- Formatter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim", opt = false },
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
