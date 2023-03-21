local status_ma_ok, ma = pcall(require, "mason")
if not status_ma_ok then
	vim.notify("Mason not found!")
	return
end

ma.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local status_malsp_ok, malsp = pcall(require, "mason-lspconfig")
if not status_malsp_ok then
	vim.notify("Mason-lsp not found!")
	return
end

--{ "DEBUG", "INFO", "WARN", "ERROR", "OFF" }
require("vim.lsp.log").set_level("OFF")

malsp.setup({
	ensure_installed = {
		"lua_ls", -- requires unzip
		"pyright", -- requires npm
		"cmake",
		"clangd",
		"marksman",
		"bashls",
		"lemminx",
		"rust_analyzer",
	},
})

local lsp_conf = require("lspconfig")
local lsp_hand = require("config.lsp.handlers")

local opts = {}

for _, server in ipairs(malsp.get_installed_servers()) do
	opts = {
		on_attach = lsp_hand.on_attach,
		capabilities = lsp_hand.capabilities,
	}
	local server_opts = require("config.lsp.settings." .. server)
	opts = vim.tbl_deep_extend("force", opts, server_opts)
	lsp_conf[server].setup(opts)
end
