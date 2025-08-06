--snip_env = {
--    s = require("luasnip.nodes.snippet").S,
--    sn = require("luasnip.nodes.snippet").SN,
--    t = require("luasnip.nodes.textNode").T,
--    f = require("luasnip.nodes.functionNode").F,
--    i = require("luasnip.nodes.insertNode").I,
--    c = require("luasnip.nodes.choiceNode").C,
--    d = require("luasnip.nodes.dynamicNode").D,
--    r = require("luasnip.nodes.restoreNode").R,
--    l = require("luasnip.extras").lambda,
--    rep = require("luasnip.extras").rep,
--    p = require("luasnip.extras").partial,
--    m = require("luasnip.extras").match,
--    n = require("luasnip.extras").nonempty,
--    dl = require("luasnip.extras").dynamic_lambda,
--    fmt = require("luasnip.extras.fmt").fmt,
--    fmta = require("luasnip.extras.fmt").fmta,
--    conds = require("luasnip.extras.expand_conditions"),
--    types = require("luasnip.util.types"),
--    events = require("luasnip.util.events"),
--    parse = require("luasnip.util.parser").parse_snippet,
--    ai = require("luasnip.nodes.absolute_indexer"),
--  }

local input = function(args, parent, user_args)
	return args[1][1]
end

-- stylua: ignore start
local utest_cfg = {
	t({ "#[cfg(test)]", "" }),
	t({ "mod tests {", "" }),
	t({ "    use super::*;", "" }),
	t({ "", "    " }), i(0), t({ "", "" }),
	t("}"),
}

local utest = {
	t({ "#[test]", "" }),
	t("fn "), i(1, "test_"), t({ "() {", "" }),
	t("    "), i(2), t({"", ""}),
	t("}"),
}

local autest = {
	t({ "#[tokio::test]", "" }),
	t("async fn "), i(1, "test_"), t({ "() {", "" }),
	t("    "), i(2), t({ "", "" }),
	t("}"),
}

local error_from = {
	t("impl From<"), i(1), t("> for "), i(2, "Error"), t({ "{", "" }),
	t("    fn from(value: "), f(input, {1}), t({ ") -> Self {", "" }),
	t("        Self::"), i(3), t("("), c(4, {t("value"), t("value.to_string()")}), t({ ")", ""}),
	t({ "    }", "" }),
	t({ "}", "" }),
}

-- stylua: ignore end

local M = {
	s("derivedebug", t("#[derive(Debug)]")),
	s("deadcode", t("#[allow(dead_code)]")),
	s("allowfreedom", t("#![allow(clippy::disallowed_names, unused_variables, dead_code)]")),
	s("clippypedantic", t("#![warn(clippy::all, clippy::pedantic)]")),
	s(":turbofish", { t({ "::<" }), i(0), t({ ">" }) }),

	s({
		trig = "cfg utest",
		name = "cfg test",
		dscr = "Rust unittest cfg macro",
	}, utest_cfg),

	s({
		trig = "utest",
		name = "unittest",
		dscr = "Rust unittest",
	}, utest),

	s({
		trig = "autest",
		name = "async unittest",
		dscr = "Tokio async unittest",
	}, autest),

	s({
		trig = "error from",
		name = "Error from trait",
		dscr = "From trait for error",
	}, error_from),
}

return M
