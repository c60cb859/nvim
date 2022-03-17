local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
  vim.notify("luasnip not found!")
  return
end

-- Shorthands --
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

-- Snippet --
local date = function() return {os.date('%Y-%m-%d')} end
local dateSnippet = s(
  {
    trig = "date",
    namr = "Date",
    dscr = "Date in the from of yyyy-mm-dd",
  },
  {
    f( date )
  }
)

local textNodeSnippet = s(
  {
    trig = "textnode",
    namr = "textnode namr",
    dscr = "textnode dscr",
  },
  {
    t( {'hello', 'world'} )
  }
)

local inserNodeSnippet = s(
  {
    trig = "insernode",
    namr = "insernode namr",
    dscr = "insernode dscr",
  },
  {
    t({"After expanding, the cursor is here ->"}), i(2, "Overwrite this"),
    t({"", "After jumping forward once, cursor is here ->"}), i(1),
    t({"", "After jumping once more, the snippet is exited there ->"}), i(0, "zero"),
  }
)

local functionSnippet = s(
  {
    trig = "functionnode",
    namr = "functionnode namr",
    dscr = "functionnode dscr",
  },
  {
    i(1),
    f(function(args, snip, user_arg_1) return args[1][1] .. user_arg_1 end,
        {1},
        { user_args = {"Will be appended to text from i(0)"}}),
    i(0)
  }
)

-- Adding snippets --
ls.snippets = {
  all = {
    dateSnippet,
    textNodeSnippet,
    inserNodeSnippet,
    functionSnippet,
  }
}
