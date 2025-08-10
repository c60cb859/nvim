return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      -- "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      -- "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",            -- optional
      -- "echasnovski/mini.pick",       -- optional
      -- "folke/snacks.nvim",           -- optional
    },
    config = function()
      require("neogit").setup({
        kind = "vsplit",
        commit_popup = {
          kind = "split",
        },
        popup = {
          kind = "split",
        },
        signs = {
          section = { "", "" },
          item = { "", "󰈔" },
          hunk = { "", "" },
        },
        commit_editor = {
          kind = "tab",
          -- Accepted values:
          -- "split" to show the staged diff below the commit editor
          -- "vsplit" to show it to the right
          -- "split_above" Like :top split
          -- "vsplit_left" like :vsplit, but open to the left
          -- "auto" "vsplit" if window would have 80 cols, otherwise "split"
          staged_diff_split_kind = "auto",
        },
      })

      vim.keymap.set("n", "<leader>gg", function()
        require("neogit").open()
      end)
      vim.api.nvim_set_hl(0, "NeogitDiffAdd", { link = "NeogitDiffAddHighlight" })
      vim.api.nvim_set_hl(0, "NeogitDiffDelete", { link = "NeogitDiffDeleteHighlight" })
    end,
  },
}
