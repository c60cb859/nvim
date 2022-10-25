local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("Lualine not found!")
	return
end

local options = {
	icons_enabled = true,
	theme = "auto",
	component_separators = { left = "|", right = "|" },
	section_separators = { left = "", right = "" },
	disabled_filetypes = {},
	always_divide_middle = true,
	globalstatus = true,
}

local line = {
	lualine_a = { "mode" },
	lualine_b = { "branch", "diff", "diagnostics" },
	lualine_c = {
		{
			"tabs",
			max_length = vim.o.columns / 3,
			mode = 1,
			tabs_color = {
				active = "lualine_a_insert",
				inactive = "lualine_a_inactive",
			},
		},
	},
	lualine_x = { "encoding", "fileformat", "filetype" },
	lualine_y = { "filesize", "progress" },
	lualine_z = { "location" },
}

lualine.setup({
	options = options,
	sections = line,
})
