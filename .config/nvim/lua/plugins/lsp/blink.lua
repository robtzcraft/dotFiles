
local cmp = require( 'blink.cmp' )
cmp.build( ):pwait( )

require( 'blink.cmp' ).setup( {
    keymap = {
        preset = "none",
        [ "<Up>" ]   = { "select_prev", "fallback" },
        [ "<Down>" ] = { "select_next", "fallback" },
        [ "<C-p>" ]  = { "select_prev", "fallback" },
        [ "<C-n>" ]  = { "select_next", "fallback" },
        [ "<Tab>" ]   = { "fallback" },
        [ "<S-Tab>" ] = { "fallback" },
        [ "<CR>" ] = {
            function( cmp )
                if cmp.is_menu_visible( ) and cmp.get_selected_item( ) then
                    return cmp.accept( )
                end
            end,
            "fallback",
        },
    },
    appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰫧",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
        },
    },
    completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        documentation = { auto_show = true },
        menu = { draw = { treesitter = { "lsp" } } },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" },
} )
