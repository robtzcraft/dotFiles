
require('./base')		-- nvim confing [not IDE or controls]
require('./settings')           -- IDE settings


require('plugins')
require('./plugins/mason-config')
require('./plugins/gruvbox')
require('./plugins/lualine')

require('./plugins/lsp/init')
