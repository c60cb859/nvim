local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Treesitter not found!")
	return
end

local parsers_to_install = {
	"bash",
	"bibtex",
	"c",
	"cmake",
	"comment",
	"cpp",
	"css",
	"cuda",
	"devicetree",
	"dockerfile",
	"dot",
	"glsl",
	"hjson",
	"html",
	"http",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"latex",
	"llvm",
	"lua",
	"make",
	"markdown",
	"ninja",
	"perl",
	"pioasm",
	"python",
	"rasi",
	"regex",
	"rst",
	"rust",
	"scss",
	"todotxt",
	"toml",
	"tsx",
	"typescript",
	"verilog",
	"vim",
	"yaml",
}

configs.setup({
	ensure_installed = parsers_to_install, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = false },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
