local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local filetypeGroup = augroup("Filetype detection", { clear = true })
autocmd("BufRead,BufNewFile", { pattern = "*.asm", command = "set filetype=asm", group = filetypeGroup })
autocmd("BufRead,BufNewFile", { pattern = "*.nasm", command = "set filetype=nasm", group = filetypeGroup })
autocmd("BufRead,BufNewFile", { pattern = "*.fasm", command = "set filetype=fasm", group = filetypeGroup })
autocmd("BufRead,BufNewFile", { pattern = "*.masm", command = "set filetype=masm", group = filetypeGroup })

-- Turn on spell checking for filetypes
local spellChecking = augroup("Enable spellchecking", { clear = true })
autocmd("Filetype", {
	pattern = "gitcommit,markdown,vimwiki",
	command = "setlocal spell",
	group = spellChecking,
})

-- Auto insert mode when switching to terminal
vim.cmd([[
augroup terminalSettings
autocmd!
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup end
]])

-- cgasm
vim.cmd([[
function! s:Cgasm()
let old_isk = &iskeyword
setl iskeyword+=:
let str = expand("<cword>")
let &l:iskeyword = old_isk
execute '!cgasm ' . str
endfunction
command! Cgasm :call s:Cgasm()

au FileType asm,nasm,fasm nnoremap <buffer>M :Cgasm<CR>
]])

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
