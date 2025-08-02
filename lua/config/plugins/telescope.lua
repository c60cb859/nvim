local builtin = require("telescope.builtin")

local search_config_dir = function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end

local fuzzy_in_file_serach = function()
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
    layout_config = { height = 0.2 },
    previewer = false,
  }))
end

local config = function()
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      sorting_strategy = "ascending",
      winblend = 20,
      prompt_prefix = " ",
      selection_prefix = "",
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })

  -- Load fzf extensions
  telescope.load_extension("fzf")

  -- Telescope keymap
  local keymap = vim.keymap.set

  keymap("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
  -- keymap("n", "<leader>fg", ':Telesope grep_string search=""<CR>', { desc = 'Telescope live grep' })
  keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
  keymap("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
  keymap("n", "z=", builtin.spell_suggest, { desc = "Telescope spell suggestions" })

  keymap("n", "en", search_config_dir, { desc = "Search files in neovim config dir" })
  keymap("n", "<leader>/", fuzzy_in_file_serach, { desc = "[/] Fuzzily search in current buffer" })

  require("config.telescope.multigrep").setup()
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = config,
}
