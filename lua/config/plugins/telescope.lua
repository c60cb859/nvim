local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("Telescope not found!")
    return
end

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
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local tsBuiltin = require("telescope.builtin")

keymap("n", "<leader>ff", tsBuiltin.find_files, opts)
--keymap("n", "<leader>fg", tsBuiltin.live_grep, opts)
keymap("n", "<leader>fg", ':Telescope grep_string search=""<CR>', opts)
keymap("n", "<leader>fb", tsBuiltin.buffers, opts)
keymap("n", "<leader>fh", tsBuiltin.help_tags, opts)
keymap("n", "z=", tsBuiltin.spell_suggest, opts)
