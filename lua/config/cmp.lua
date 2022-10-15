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

-- Mapping
local move_forward = function()
    if cmp.visible() then
        cmp.select_next_item()
    else
        cmp.complete()
    end
end

local move_backward = function()
    if cmp.visible() then
        cmp.select_prev_item()
    end
end

local mapping = {
    ["<c-n>"] = cmp.mapping(move_forward, { "i", "s" }),
    ["<c-p>"] = cmp.mapping(move_backward, { "i", "s" }),
    ["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<c-c>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
    }),
    ["<cr>"] = cmp.mapping.confirm({ select = false }),
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
local lsp = { name = "nvim_lsp", keyword_length = 4, max_item_count = 5 }
local lua = { name = "nvim_lua", keyword_length = 4, max_item_count = 5 }
local snip = { name = "luasnip", keyword_length = 4, max_item_count = 5 }

local buffer = {
    name = "buffer",
    keyword_length = 4,
    max_item_count = 5,
    option = {
        get_bufnrs = function()
            return vim.api.nvim_list_bufs()
        end,
    },
}

local path = { name = "path", keyword_length = 4, max_item_count = 5 }

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
        buffer,
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
