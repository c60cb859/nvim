local config = function()
  local render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local res = bufname ~= "" and vim.fn.fnamemodify(bufname, ":.t") or "󰈤 [No Name]"
    if vim.api.nvim_get_option_value("modified", { buf = props.buf }) then
      res = res .. " 󰏫"
    end
    return res
  end

  require("incline").setup({
    hide = {
      cursorline = true,
    },
    render = render,
  })
end

return {
  {
    "b0o/incline.nvim",
    config = config
  }
}
