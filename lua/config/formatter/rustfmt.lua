local rustfmt = require("null-ls.builtins.formatting.rustfmt")

local source = rustfmt.with({
	extra_args = { "--edition=2021" },
})

return source
