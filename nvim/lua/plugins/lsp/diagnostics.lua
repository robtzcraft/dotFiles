-- Configurar diagnósticos en tiempo real
vim.diagnostic.config({
    virtual_text = true,  -- Muestra errores en línea
    signs = true,         -- Muestra íconos en la columna de la izquierda
    update_in_insert = true,  -- Actualiza diagnósticos mientras escribes
    underline = true,     -- Subraya los errores
    severity_sort = true, -- Ordena los errores por severidad
})
