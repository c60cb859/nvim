local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Turn on spell checking for filetypes
local spellChecking = augroup("Enable spellchecking", { clear = true })
autocmd("Filetype", {
	pattern = "gitcommit,markdown,vimwiki,NeogitCommitMessage",
	command = "setlocal spell",
	group = spellChecking,
})

local quickfix = augroup("QuichFix settings", { clear = true })
autocmd("Filetype", {
	pattern = "qf",
	callback = function()
		vim.wo.wrap = false
	end,
	group = quickfix,
})

--local test = function()
--    local win = vim.api.nvim_get_current_win() -- save where we are now
--    local bufnr = vim.api.nvim_get_current_buf()
--    local params = vim.lsp.util.make_position_params() -- create params for "go to definition"
--    local method = "textDocument/typeDefinition"
--    local lsp_response = vim.lsp.buf_request_sync(bufnr, method, params, 1000) -- call the LSP(s)
--    print(vim.inspect(lsp_response))
--    local result = {}
--    for _, client in pairs(lsp_response) do -- loop over all LSPs
--        for _, r in pairs(client.result) do -- loop over all results per LSP
--            table.insert(result, r) -- put them in a table
--        end
--    end
--
--    local file_path = result[1]["uri"]
--    local buffer = vim.api.nvim_create_buf(false, true)
--    vim.api.nvim_buf_set_option(buffer, "bufhidden", "hide")
--    print(vim.inspect(vim.api.nvim_buf_is_loaded(buffer)))
--
--    vim.api.nvim_buf_call(buffer, function()
--        vim.cmd("view " .. file_path)
--    end)
--    --[[
--    print(vim.inspect(vim.api.nvim_buf_is_loaded(buffer)))
--
--    print("-------------------")
--    print(vim.inspect(result[1]["range"]["start"]))
--    print(vim.inspect(result[1]["range"]["end"]))
--    print("-------------------")
--
--    print(vim.inspect(vim.api.nvim_buf_is_loaded(buffer)))
--    print(vim.inspect(vim.api.nvim_buf_is_valid(buffer)))
--    local enum_name = vim.api.nvim_buf_get_text(
--        buffer,
--        result[1]["range"]["start"]["line"],
--        result[1]["range"]["start"]["character"],
--        result[1]["range"]["end"]["line"],
--        result[1]["range"]["end"]["character"] + 1,
--        {}
--    )
--
--    print(vim.inspect(enum_name))
--    --]]
--
--    local enum_list = vim.treesitter.parse_query(
--        "cpp",
--        [[
--        (enum_specifier
--          name: (type_identifier) @name (#eq? @name "week_day")
--          body: (enumerator_list) @list
--          )
--        ]]
--    )
--
--    local get_root = function(buf)
--        local parser = vim.treesitter.get_parser(buf, "cpp", {})
--        local tree = parser:parse()[1]
--        return tree:root()
--    end
--
--    local root = get_root(buffer)
--
--    print(vim.inspect(root))
--
--    vim.api.nvim_buf_detach(buffer)
--end
--
--vim.api.nvim_create_user_command("TestLSP", test, {})
