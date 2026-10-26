
local cmp = require( 'blink.cmp' )
cmp.build( ):pwait( )
cmp.setup( )

require( 'blink.cmp' ).setup( {
    keymap = { preset = "super-tab" },
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
        documentation = { auto_show = true },
        menu = {
            draw = {
                treesitter = { "lsp" },
            },
        },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" },
} )
