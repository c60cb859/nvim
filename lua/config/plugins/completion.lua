return {
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*", --   test

    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },

      completion = {
        documentation = { auto_show = true },
        trigger = { show_on_keyword = true },
      },

      sources = {
        default = { "lsp", "buffer", "path", "snippets" },
        providers = {
          lsp = { fallbacks = {} },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
