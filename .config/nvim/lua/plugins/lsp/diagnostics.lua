-- Configuración de diagnósticos de LSP
vim.diagnostic.config({
    virtual_text = true,  -- Muestra mensajes de diagnóstico en línea
    signs = true,         -- Muestra signos en el margen izquierdo
    update_in_insert = true,  -- Actualización de diagnósticos en modo inserción
    underline = true,     -- Subraya el texto problemático
    severity_sort = true, -- Ordena los diagnósticos por severidad
    float = {             -- Configuración de ventanas flotantes
        border = "rounded", -- Borde redondeado para la ventana flotante
        source = "always",  -- Muestra la fuente del diagnóstico (por ejemplo, el nombre del LSP)
        header = "",        -- Puedes personalizar el encabezado de la ventana flotante
        prefix = "",        -- Prefijo para cada línea de diagnóstico en la ventana flotante
    },
    severity = {          -- Configuración de colores por severidad
        min = vim.diagnostic.severity.HINT,  -- Mínima severidad a mostrar
        max = vim.diagnostic.severity.ERROR, -- Máxima severidad a mostrar
    },
})

-- Atajos de teclado para navegar por los diagnósticos
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- Personalización de los signos de diagnóstico
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configuración de colores para los diagnósticos
vim.cmd([[ 
    highlight DiagnosticError guifg=#ff0000
    highlight DiagnosticWarn guifg=#ffa500
    highlight DiagnosticInfo guifg=#00bfff
    highlight DiagnosticHint guifg=#add8e6
    highlight DiagnosticUnderlineError gui=undercurl guisp=#ff0000
    highlight DiagnosticUnderlineWarn gui=undercurl guisp=#ffa500
    highlight DiagnosticUnderlineInfo gui=undercurl guisp=#00bfff
    highlight DiagnosticUnderlineHint gui=undercurl guisp=#add8e6
]])

