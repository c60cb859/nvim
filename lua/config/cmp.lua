local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	vim.notify("nvim-cmp not found!")
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("luasnip not found!")
	return
end

local snip_expand = function(args)
	luasnip.lsp_expand(args.body) -- For `luasnip` users.
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Mapping

local has_words_before = function()
	-- unpack moved to table.unpack, but vim still use the old version
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local move_forward = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	elseif has_words_before() then
		cmp.complete()
	else
		fallback()
	end
end

local move_backward = function(fallback)
	if cmp.visible() then
		cmp.select_prev_item()
	elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end

local mapping = {
	["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<c-c>"] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	-- accept currently selected item. if none selected, `select` first item.
	-- set `select` to `false` to only confirm explicitly selected items.
	["<cr>"] = cmp.mapping.confirm({ select = false }),
	["<c-n>"] = cmp.mapping(move_forward, { "i", "s" }),
	["<c-p>"] = cmp.mapping(move_backward, { "i", "s" }),
}

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local format = function(entry, vim_item)
	-- Kind icons
	--vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
	vim_item.menu = ({
		nvim_lsp = "[LSP]",
		nvim_lua = "[Lua]",
		luasnip = "[Snip]",
		buffer = "[Buf]",
		path = "[Path]",
	})[entry.source.name]
	return vim_item
end

-- Sources
local lsp = { name = "nvim_lsp" }
local lsp_signature = { namu = "nvim_lsp_signature_help" }
local lua = { name = "nvim_lua" }
local snip = { name = "luasnip" }

local buffer = {
	name = "buffer",
	keyword_length = 3,
	max_item_count = 5,
	option = {
		get_bufnrs = function()
			return vim.api.nvim_list_bufs()
		end,
	},
}

local path = { name = "path" }

-- Setup
cmp.setup({
	snippet = {
		expand = snip_expand,
	},
	mapping = mapping,
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = format,
	},
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	sources = {
		lsp,
		lsp_signature,
		lua,
		snip,
		buffer,
		path,
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	sources = {
		{ name = "nvim_lsp_document_symbol" },
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})
