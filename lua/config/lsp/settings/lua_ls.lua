return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "awesome", "client", "root", "screen" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
