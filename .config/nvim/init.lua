-- Robtz's neovim config

-- Preload modules
if vim.loader then
    vim.loader.enable()
end

require('./base')

require('./settings')           -- IDE settings

require('plugins')
require('./plugins/mason-config')
require('./plugins/gruvbox')
require('./plugins/lualine')

require('./plugins/lsp/init')
