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
		-- cmp
		CmpItemMenu = { fg = "$grey" },
	},
})

onedark.load()
