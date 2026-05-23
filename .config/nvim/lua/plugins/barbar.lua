
vim.g.barbar_auto_setup = false

require( 'barbar' ).setup {

    animation = true,
    auto_hide = false,

    icons = {
        separator = {
            left = '|'
        },
    },

    -- Nvimtree offset
    sidebar_filetypes = {
        NvimTree = { text = 'File Explorer', align = 'center' }
    }
}
