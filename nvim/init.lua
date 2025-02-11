
vim.g.mapleader = ' '

vim.opt.foldmethod="indent"
vim.opt.foldmethod="marker"

require('settings')           -- IDE settings
require('base')

require('plugins')
require('./plugins/nord')
-- require('./plugins/bufferline')
require('./plugins/lualine')
require('./plugins/treesitter')
require('./plugins/nvim-tree')

require('./plugins/lsp/init')
