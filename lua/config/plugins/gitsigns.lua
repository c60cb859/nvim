-- GitSigns keymap
-- local on_attach = function(bufnr)
-- 	local gs = package.loaded.gitsigns
-- 	local opts = { noremap = true, silent = true, buffer = bufnr }
-- 	local keymap = vim.keymap.set
--
-- 	keymap("n", "<leader>gs", gs.stage_hunk, opts)
-- 	keymap("n", "<leader>gr", gs.reset_hunk, opts)
-- 	keymap("n", "<leader>gu", gs.undo_stage_hunk, opts)
-- 	keymap("n", "<leader>gS", gs.stage_buffer, opts)
-- 	keymap("n", "<leader>gR", gs.reset_buffer, opts)
-- 	keymap("n", "<leader>gp", gs.preview_hunk, opts)
-- 	keymap("n", "g.", gs.next_hunk, opts)
-- 	keymap("n", "g,", gs.prev_hunk, opts)
-- end

return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    config = function()
      require("gitsigns").setup({
        -- on_attach = on_attach,
        signcolumn = false,
        numhl = true,
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 1500,
        },
        current_line_blame_formatter = "          <author>, <author_time> [<abbrev_sha>]",
        preview_config = {
          border = "none",
        },
      })
    end
  }
}
