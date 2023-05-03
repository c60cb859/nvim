local status_ok, rainbow = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Rainbow not found!")
	return
end

rainbow.setup({
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		strategy = require("ts-rainbow").strategy.global,
		hlgroups = {
			"TSRainbowBlue",
			"TSRainbowViolet",
			"TSRainbowCyan",
			"TSRainbowGreen",
			"TSRainbowOrange",
			"TSRainbowRed",
			"TSRainbowYellow",
		},
	},
})

--[[ Old rainbow plugin conf
rainbow.setup({
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
}) ]]
