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


-- stylua: ignore start
local short = {
    c(1, {
		t("feat("),
		t("fix("),
		t("docs("),
		t("style("),
		t("refactor("),
		t("perf("),
		t("test("),
		t("chore("),
	}), i(2, "scope"), t("): "), i(3, "subject"),
}

local long = {
    c(1, {
		t("feat("),
		t("fix("),
		t("docs("),
		t("style("),
		t("refactor("),
		t("perf("),
		t("test("),
		t("chore("),
	}), i(2, "scope"), t("): "), i(3, "subject"),
	t({"", "", ""}),
	i(4, "Message"),
	t({"", "", ""}),
		c(5, {
			t("Jira: "),
			t("Git: "),
			t("")
		}),
	i(6, "References"),
}
-- stylua: ignore end

local M = {
	s({
		trig = "commit short",
		name = "Short commit template",
		dscr = "Template for commit messages",
	}, short),

	s({
		trig = "commit long",
		name = "Long commit template",
		dscr = "Template for commit messages",
	}, long),
}

return M
