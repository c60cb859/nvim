local ts_config_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ts_config_ok then
	vim.notify("Treesitter configs not found!")
	return
end

local rainbow_ok, rainbow = pcall(require, "ts-rainbow")
if not rainbow_ok then
	vim.notify("ts-rainbow not found")
	return
end

ts_config.setup({
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		strategy = {
			rainbow.strategy["global"],
		},
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
