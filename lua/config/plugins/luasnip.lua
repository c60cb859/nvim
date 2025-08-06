return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp"
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      local ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "󰯲", "TSRainbowOrange" } },
          },
        },
        [types.insertNode] = {
          active = {
            virt_text = { { "󰰄", "TSRainbowGreen" } },
          },
        },
      }

      ls.setup({
        enable_autosnippets = false,
        ext_opts = ext_opts,
      })

      require("luasnip/loaders/from_vscode").lazy_load()
      require("luasnip/loaders/from_lua").lazy_load()

      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set

      keymap({ "i", "s" }, "<c-l>", function()
        if ls.choice_active() then
          ls.change_choice()
        end
      end, opts)
    end,
  },
}
