-- Markdown options
vim.opt_local.list = false

-- Image render
vim.keymap.set("n", "<localleader>r", function()
    local img = require("image")

    if img.is_enabled() then
      img.disable()
    else
      img.enable()
    end
  end,
  { desc = "Toggle image rendering" })
