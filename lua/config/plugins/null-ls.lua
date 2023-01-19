local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("null-ls not found")
	return
end

local filter = function(client)
	return client.name == "null-ls"
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, filter = filter })
			end,
		})
	end
end

null_ls.setup({
	on_attach = on_attach,
})

-- Formatters
null_ls.register(require("config.formatter.stylua"))
null_ls.register(require("config.formatter.clang_format"))
null_ls.register(require("config.formatter.black"))
null_ls.register(require("config.formatter.rustfmt"))
null_ls.register(require("config.formatter.prettier"))

-- diagnostics
null_ls.register(require("config.linter.selene"))
null_ls.register(require("config.linter.flake8"))
-- null_ls.register(require("config.linter.erb"))
