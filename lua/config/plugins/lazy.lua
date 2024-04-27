local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Lua helper plugin
	"nvim-lua/plenary.nvim",

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = false },
			{ "kyazdani42/nvim-web-devicons", lazy = false },
			{ "nvim-telescope/telescope-fzf-native.nvim", lazy = false, build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim", lazy = false },
		},
	},

	-- Colorschemes
	"navarasu/onedark.nvim",

	-- Obsession
	"tpope/vim-obsession",

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", lazy = false },
	},
	-- Incline
	"b0o/incline.nvim",

	-- git plugin
	"lewis6991/gitsigns.nvim",
	{
		"TimUntersberger/neogit",
		dependencies = {
			{ "sindrets/diffview.nvim", lazy = false },
			{ "nvim-lua/plenary.nvim", lazy = false },
		},
	},

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- LSP
	"neovim/nvim-lspconfig",
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	"williamboman/mason-lspconfig.nvim",
	"folke/trouble.nvim",

	-- Auto Completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lsp-document-symbol",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-- Lua Completion for neovim API
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Boole
	"nat-418/boole.nvim",

	-- autopairs
	"windwp/nvim-autopairs",

	-- indent line
	"lukas-reineke/indent-blankline.nvim",

	-- Yocto bitbake syntax
	"kergoth/vim-bitbake",

	-- bufMov
	--"/home/theis/git/bufMov"
	"c60cb859/bufMov.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/playground", lazy = false },
			{ "nvim-treesitter/nvim-treesitter-context", lazy = false },
			{ "HiPhish/nvim-ts-rainbow2", lazy = false },
			{ "folke/twilight.nvim", lazy = false },
			{ "numToStr/Comment.nvim", lazy = false },
		},
	},

	-- Formatter
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = false },
		},
	},

	"sotte/presenting.vim",
	{ "vladdoster/remember.nvim", config = [[ require('remember') ]] },

	"imsnif/kdl.vim",
})
