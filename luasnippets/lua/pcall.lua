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
local snip = {
  t("local "), i(1, "status_ok"), t(", "), i(2, "name"), t(" = pcall(require, \""), i(3, "package"), t("\")"),
  t({ "", "if not " }), f(input, {1}), t(" then"),
  t({ "", "    vim.notify(\"" }), f(input, {3}), t(" not found\")"),
  t({ "", "    return" }),
  t({ "", "end" })
}
-- stylua: ignore end

local M = {
    s({
        trig = "pcall",
        name = "Protected call",
        dscr = "Gracefully fail if package is not found",
    }, snip),
}

return M
