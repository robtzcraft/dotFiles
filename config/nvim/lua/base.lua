
-- Basics

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- First contact
vim.cmd("autocmd!")

-- Nvim enconding
vim.scriptencofing = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Interface
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2


-- Colorscheme
-- require('./plugins/everforest')
require('./plugins/gruvbox')
require('./plugins/nvim-tree')
require('./plugins/lspconfig')

