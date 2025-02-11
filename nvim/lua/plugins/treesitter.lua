
-- Dentro de ensure_installed se encuentran los lenguajes a soportar, servidores se instalan una
-- vez iniciado el editor... revisar si se pueden actualizar los servidores

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 
      "c", 
      "lua", 
      "vim", 
      "vimdoc", 
      "query", 
      "markdown", 
      "markdown_inline", 
      "python", 
      "javascript", 
      "typescript" 
    }, -- Lenguajes que quieres soportar

    sync_install = true,
    auto_install = true,

    highlight = {
        enable = true, -- Habilita el resaltado de sintaxis
    },
}
