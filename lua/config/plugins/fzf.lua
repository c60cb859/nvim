local winopts = {
  height = 0.30,
  width = 0.80,
  row = 0.50,
  col = 0.50,
  fullscreen = false,
}

local keymap = {
  builtin = {
    -- neovim `:tmap` mappings for the fzf win
    ["<F1>"] = "toggle-help",
    ["<F2>"] = "toggle-fullscreen",
    -- Only valid with the 'builtin' previewer
    ["<F3>"] = "toggle-preview-wrap",
    ["<F4>"] = "toggle-preview",
    -- Rotate preview clockwise/counter-clockwise
    ["<F5>"] = "toggle-preview-ccw",
    ["<F6>"] = "toggle-preview-cw",
    ["<c-j>"] = "preview-page-down",
    ["<c-k>"] = "preview-page-up",
    ["<c-h>"] = "preview-page-reset",
  }
}

local files = {
  prompt = ' ',
}

local grep = {
  prompt = ' ',
  continue_last_search = false,
}

local buffers = {
  prompt = '﬘ ',
}

local git = {
  icons = {
    ["M"] = {icon = "~", color = "yellow" },
    ["D"] = {icon = "-", color = "red" },
    ["A"] = {icon = "+", color = "green" },
  },
}

local lsp = {
  icons = {
    ["Error"] = { icon = "", color = "red" },
    ["Warning"] = { icon = "", color = "yellow" },
    ["Information"] = { icon = "", color = "magenta" },
    ["Hint"] = { icon = "", color = "blue" },
  },
}

local previewers = {
  builtin = {
    extensions = {
      -- neovim terminal only supports `viu` block output
      ["png"] = { "viu", "-b" },
      ["jpg"] = { "ueberzug" },
    },
    -- When using 'ueberzug' we can also control the way images
    -- fill the preview area with ueberzug's image scaler, set to:
    --   false (no scaling), "crop", "distort", "fit_contain",
    --   "contain", "forced_cover", "cover"
    -- For more details see:
    -- https://github.com/seebye/ueberzug
    ueberzug_scaler = "cover",
  }
}

--local actions = require("fzf-lua.actions")
require('fzf-lua').setup {
  global_resume = true,
  global_resume_query = true,
  winopts = winopts,
  keymap = keymap,
  files = files,
  grep = grep,
  buffers = buffers,
  git = git,
  lsp = lsp,
  previewers = previewers,
}

