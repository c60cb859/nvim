local sql = require("null-ls.builtins.formatting.sql_formatter")

local source = sql.with({
	extra_args = { "-l", "postgresql" },
	-- extra_args = { "-c", "./.sql-formatter.json" },
})

return source
