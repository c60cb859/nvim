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
}

