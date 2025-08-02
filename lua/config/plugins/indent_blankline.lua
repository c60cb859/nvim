local config = function()
  local hooks = require("ibl.hooks")
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Grey", { fg = "#4b5263" })
  end)

  require("ibl").setup({
    scope = { enabled = false },
    indent = {
      char = "│",
      highlight = { "Grey" },
    },
  })
end

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    --- @module "ibl"
    --- @type ibl.config
    opts = {},
    config = config,
  },
}
