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
        -- max_length = vim.o.columns / 3,
        mode = 0,
        tabs_color = {
          active = "lualine_a_insert",
          inactive = "lualine_b_normal",
        },
        symbols = {
          modified = " 󰏫", -- Text to show when the file is modified.
        },
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
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config,
  },
}
