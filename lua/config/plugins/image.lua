return {
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      integrations = {
        markdown = {
          only_render_image_at_cursor = true, -- defaults to false
          only_render_image_at_cursor_mode = "inline", -- "popup" or "inline", defaults to "popup"
        },
      },
    },
  },
}
