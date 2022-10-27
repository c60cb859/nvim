local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
	vim.notify("Onedark not found!")
	return
end

onedark.setup({
	style = "dark",
	toggle_style_key = "<leader>c",
	toggle_style_list = { "darker", "cool", "deep", "warm", "warmer", "light", "dark" },

	highlights = {
		-- LSP document highlights
		LspReferenceText = { bg = "$grey" },
		LspReferenceRead = { bg = "$grey", fg = "$cyan" },
		LspReferenceWrite = { bg = "$grey", fg = "$yellow" },
		-- Rainbow parentheses
		rainbowcol1 = { fg = "$fg" },
		-- Tree Sitter color tweaks
		["@keyword"] = { fg = "$red" },
		["@keyword.function"] = { fg = "$red" },
		["@namespace"] = { fg = "$blue" },
		["@property"] = { fg = "$red" },
		["@field"] = { fg = "$red" },
		["@func.builtin"] = { fg = "$blue" },
		["@constant"] = { fg = "$cyan" },
		["@constructor"] = { fg = "$blue", fmt = "bold" },
		["@operator"] = { fg = "$purple" },
		-- Treesitter context
		TreesitterContext = { bg = "$bg1", fmt = "bold,italic" },
		TreesitterContextLineNumber = { fg = "$purple" },
		-- cmp
		CmpItemMenu = { fg = "$grey" },
		-- Diff
		DiffAdd = { fg = "$green", bg = "$bg1", fmt = "bold" },
		DiffDelete = { fg = "$red", bg = "$bg1", fmt = "italic" },
		-- neogit
		NeogitNotificationInfo = { fg = "$green" },
		NeogitNotificationWarning = { fg = "$yellow" },
		NeogitNotificationError = { fg = "$red" },

		NeogitDiffAddHighlight = { fg = "$green", bg = "$bg1", fmt = "bold" },
		NeogitDiffDeleteHighlight = { fg = "$red", bg = "$bg1", fmt = "italic" },
		NeogitDiffContextHighlight = { fg = "$none", bg = "$bg0" },
		NeogitHunkHeader = { fg = "$blue", bg = "$bg1" },
		NeogitHunkHeaderHighlight = { fg = "$purple", bg = "$bg1" },
	},
})

onedark.load()
