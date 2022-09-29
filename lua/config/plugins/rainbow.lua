require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {
      '#abb2bf', -- white
      '#e5c07b', -- light yellow
      '#e06c75', -- light red
      '#98c379', -- Green
      '#61afef', -- Blue
      '#c678dd', -- Magenta
      '#56b6c2', -- Cyan
      '#be5046', -- dark red
      '#d19a66', -- dark yellow
    },
  }
}
