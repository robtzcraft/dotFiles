
-- Autoformat (lua files)
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Delete white spaces on on the end of file
vim.api.nvim_create_autocmd('BufWritePre'. {
  pattern = '*',
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})
