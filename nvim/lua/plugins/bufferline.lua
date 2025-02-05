-- ~/.config/nvim/lua/plugins/bufferline.lua

require("bufferline").setup {
    options = {
        -- Filtrar el buffer de nvim-tree
        custom_filter = function(buf_number)
            -- Excluir el buffer de nvim-tree
            if vim.bo[buf_number].filetype == "NvimTree" then
                return false
            end
            return true
        end,
    },
}
