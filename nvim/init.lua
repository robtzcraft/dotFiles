
vim.g.mapleader = ' '

require('settings')           -- IDE settings
require('base')

require('plugins')
require('./plugins/nord')
require('./plugins/bufferline')

require('./plugins/lsp/init')
require('./plugins/barbar')
