return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    --- @module 'render-markdown'
    --- @type render.md.UserConfig
    opts = {
      sign = {
        enabled = false,
      },
      heading = {
        position = "inline",
      },
      code = {
        language_border = " ",
        language_left = "",
        language_right = "",
        width = "block",
        min_width = 45,
        position = "right",
      },
      pipe_table = {
        preset = "round",
      },
      latex = {
        enabled = false,
      },
      html = {
        enabled = false,
      },
    },
  },
}
