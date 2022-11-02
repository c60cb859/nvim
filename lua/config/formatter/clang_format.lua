local clang_format = require("null-ls.builtins.formatting.clang_format")

local source = clang_format.with({
	condition = function(utils)
		return utils.root_has_file(".clang-format")
	end,
})

return source
