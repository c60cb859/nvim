local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Install servers by default
local servers = {
  "sumneko_lua", -- requires unzip
  "pyright", -- requires npm
  "cmake",
  "clangd",
  "zeta_note",
  "bashls",
  "lemminx",
  "rust_analyzer",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    vim.notify("Installing " .. name)
    server:install()
  end
end

-- Remove boarder on installer window
vim.cmd [[ autocmd Filetype lsp-installer lua vim.api.nvim_win_set_config(0, { border = "none" }) ]]

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local server_opts = require("config.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local server_opts = require("config.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "pyright" then
    local server_opts = require("config.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "cmake" then
    local server_opts = require("config.lsp.settings.cmake")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "clangd" then
    local server_opts = require("config.lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "zeta_note" then
    local server_opts = require("config.lsp.settings.zeta_note")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "bashls" then
    local server_opts = require("config.lsp.settings.bashls")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "lemminx" then
    local server_opts = require("config.lsp.settings.lemminx")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  if server.name == "rust_analyzer" then
    local server_opts = require("config.lsp.settings.rust_analyzer")
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
