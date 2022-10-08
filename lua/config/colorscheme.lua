-- Colors
require("onedark").setup({
	-- Main options --
	style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = "<leader>c", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "darker", "cool", "deep", "warm", "warmer", "light", "dark" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = true, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {},
	highlights = {
		-- LSP document highlights
		LspReferenceText = { bg = "$grey" },
		LspReferenceRead = { bg = "$grey", fg = "$cyan" },
		LspReferenceWrite = { bg = "$grey", fg = "$yellow" },
		-- Bad trailing white space color
		BadWhitespace = { bg = "$red" },
		-- Rainbow parentheses
		rainbowcol1 = { fg = "$fg" },
		-- Tree Sitter color tweaks
		TSKeyword = { fg = "$red" },
		TSKeywordFunction = { fg = "$red" },
		TSNamespace = { fg = "$blue" },
		TSProperty = { fg = "$red" },
		TSField = { fg = "$red" },
		TSFuncBuiltin = { fg = "$blue" },
		TSConstant = { fg = "$cyan" },
		TSConstructor = { fg = "$blue", fmt = "bold" },
		TSOperator = { fg = "$purple" },
	},

	-- Plugins Config --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})

require("onedark").load()
