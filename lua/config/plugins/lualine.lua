local config = function()
  local options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = " " },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  }

  local line = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "tabs",
        max_length = vim.o.columns / 3,
        mode = 1,
        tabs_color = {
          active = "lualine_a_insert",
          inactive = "lualine_b_normal",
        },
        show_modified_status = false,
      },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "location" },
    lualine_z = { "lsp_status" },
  }

  require("lualine").setup({
    options = options,
    sections = line,
  })

  vim.keymap.set("n", "<A-r>", ":LualineRenameTab ", { desc = "Rename tab" })
  vim.keymap.set("i", "<A-r>", ":LualineRenameTab ", { desc = "Rename tab" })
  vim.keymap.set("t", "<A-r>", "<C-\\><C-n>:LualineRenameTab ", { desc = "Rename tab" })
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config,
  },
}
