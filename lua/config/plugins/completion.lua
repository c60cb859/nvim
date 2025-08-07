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
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-y>"] = { "show", "select_and_accept" },

        ["<C-p>"] = { "show", "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "show", "select_next", "fallback_to_mappings" },

        ["<C-e>"] = { "hide" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-k>"] = { "snippet_forward", "fallback" },
        ["<c-j>"] = { "snippet_backward", "fallback" },

        ["<C-S-k>"] = { "show_signature", "hide_signature", "fallback" },
      },

      cmdline = {
        keymap = {
          preset = "none",
          ["<C-y>"] = { "show", "select_and_accept" },

          ["<C-p>"] = { "show_and_insert", "select_prev", "fallback_to_mappings" },
          ["<C-n>"] = { "show_and_insert", "select_next", "fallback_to_mappings" },

          ["<C-e>"] = { "hide" },
        },
        completion = { menu = { preselect = true, auto_show = true } },
      },

      appearance = {
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },

      completion = {
        documentation = { auto_show = true },
        trigger = { show_on_keyword = true },
      },

      snippets = { preset = "luasnip" },
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
