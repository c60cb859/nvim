local cmake_format = require("null-ls.builtins.formatting.cmake_format")

local source = cmake_format.with({
	-- condition = function(utils)
	-- 	return utils.root_has_file(".cmake-format.yaml")
	-- end,
})

return source
