
-- Mapear <Leader>e para abrir/cerrar nvim-tree
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Mapear <Leader>t para abrir una nueva pestaña
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>', ':tabclose<CR>', { noremap = true, silent = true })

-- Alternar nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Mapear <Leader>n para ir al siguiente buffer
vim.api.nvim_set_keymap('n', '<Leader>n', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Mapear <Leader>p para ir al buffer anterior
vim.api.nvim_set_keymap('n', '<Leader>p', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Mapear <Leader>1, <Leader>2, etc. para cambiar a buffers específicos
for i = 1, 9 do
    vim.api.nvim_set_keymap('n', '<Leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { noremap = true, silent = true })
end
