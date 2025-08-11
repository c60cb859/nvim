local rainbow_ok, rainbow = pcall(require, "rainbow-delimiters.setup")
if not rainbow_ok then
	vim.notify("ts-rainbow not found")
	return
end

require("rainbow-delimiters.setup").setup({
	highlight = {
		"TSRainbowBlue",
		"TSRainbowViolet",
		"TSRainbowCyan",
		"TSRainbowGreen",
		"TSRainbowOrange",
		"TSRainbowRed",
		"TSRainbowYellow",
	},
})
