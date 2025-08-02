local config = function()
  vim.lsp.enable({
    "lua_ls",
    "rust_analyzer",
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

      -- Auto-format ("lint") on save.
      -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
      if
        not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting")
      then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
          end,
        })
      end
    end,
  })

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.HINT] = "",
        [vim.diagnostic.severity.INFO] = "",
      },
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      source = true,
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- 'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = config,
  },
}
