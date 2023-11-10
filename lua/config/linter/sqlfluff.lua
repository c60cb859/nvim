local sqlfluff = require("null-ls.builtins.diagnostics.sqlfluff")

local source = sqlfluff.with({
	extra_args = { "--dialect", "postgres" },
})

return source
