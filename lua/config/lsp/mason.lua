local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    }
  }
}

require("mason-lspconfig").setup {
  ensure_installed = {
    "sumneko_lua", -- requires unzip
    "pyright", -- requires npm
    "cmake",
    "clangd",
    "marksman",
    "bashls",
    "lemminx",
    "rust_analyzer",
  },
}


local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {
  on_attach = require("config.lsp.handlers").on_attach,
  settings = {
    Lua = {
      format = {
        enable = true
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    }
  }
}
