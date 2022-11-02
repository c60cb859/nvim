local stylua = require("null-ls.builtins.formatting.stylua")

local source = stylua.with({
	condition = function(utils)
		return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
	end,
})

return source
