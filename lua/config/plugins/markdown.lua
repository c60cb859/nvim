local preview_options = {
	mkit = {},
	katex = {},
	uml = {},
	maid = {},
	disable_sync_scroll = 0,
	sync_scroll_type = "middle",
	hide_yaml_meta = 1,
	sequence_diagrams = {},
	flowchart_diagrams = {},
	content_editable = "v:false",
	disable_filename = 0,
	toc = {},
}

local options = {
	mkdp_auto_start = 0,
	mkdp_auto_close = 1,
	mkdp_refresh_slow = 0,
	mkdp_command_for_global = 0,
	mkdp_open_to_the_world = 0,
	mkdp_open_ip = "",
	mkdp_browser = "firefox",
	mkdp_echo_preview_url = 0,
	mkdp_browserfunc = "",
	mkdp_markdown_css = "",
	mkdp_highlight_css = "",
	mkdp_port = "",
	mkdp_page_title = "「${name}」",
	mkdp_filetypes = { "markdown" },
	mkdp_theme = "dark",
	mkdp_preview_options = preview_options,
}

for key, value in pairs(options) do
	vim.g[key] = value
end
