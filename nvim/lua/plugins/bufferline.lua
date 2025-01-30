-- init.lua
require('bufferline').setup({
    options = {
        mode = "buffers",  -- Modo de buffers (también puede ser "tabs")
        numbers = "none",  -- Mostrar números en las pestañas (opcional)
        diagnostics = "nvim_lsp",  -- Mostrar diagnósticos en las pestañas
        offsets = {
            {
                filetype = "NvimTree",  -- Tipo de archivo para nvim-tree
                text = " Files",      -- Texto que se mostrará junto a nvim-tree
                highlight = "Directory",-- Resaltado para el texto
                text_align = "left",    -- Alineación del texto
            },
        },
    },
    highlights = {
        -- Deshabilitar el borde de las pestañas
        fill = {
            guibg = "NONE",  -- Fondo transparente
        },
        background = {
            guibg = "NONE",  -- Fondo transparente
        },
        buffer_visible = {
            guibg = "NONE",  -- Fondo transparente
        },
        buffer_selected = {
            guibg = "NONE",  -- Fondo transparente
        },
        separator = {
            guifg = "NONE",  -- Color del separador (transparente)
            guibg = "NONE",  -- Fondo del separador (transparente)
        },
        separator_selected = {
            guifg = "NONE",  -- Color del separador seleccionado (transparente)
            guibg = "NONE",  -- Fondo del separador seleccionado (transparente)
        },
        separator_visible = {
            guifg = "NONE",  -- Color del separador visible (transparente)
            guibg = "NONE",  -- Fondo del separador visible (transparente)
        },
    },
})
