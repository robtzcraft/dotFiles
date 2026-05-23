
-- Keymaps
-- vim.keymap.set( { modes }, { lhs }, { rhs }, { options } )
--
-- Modes: n: normal, i: insert, v: visual
-- lhs: custom keystroke ( e.g. <leader>w )

-- Leader
vim.g.mapleader = ' '

-- Default keymaps deleted
-- vim.keymap.del( 'n', '<Tab>' )

vim.keymap.set( { 'n', 'i' }, '<C-s>', '<cmd>write<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-Right>', '<cmd>BufferNext<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-Left>', '<cmd>BufferPrevious<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-a>', '<cmd>NvimTreeFocus<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-q>', '<cmd>BufferClose<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-z>', '<cmd>undo<CR>', { remap = false } )
