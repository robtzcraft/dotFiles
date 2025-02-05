-- lsp.lua
local lspconfig = require('lspconfig')

-- Configurar typescript-language-server (TypeScript/JavaScript)
lspconfig.ts_ls.setup({  -- Cambia esto por `ts_ls`
    on_attach = function(client, bufnr)
        -- Habilitar autocompletado
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keymaps para LSP
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

        -- Habilitar diagnósticos en tiempo real
        vim.api.nvim_create_autocmd('CursorHold', {
            buffer = bufnr,
            callback = function()
                vim.diagnostic.open_float(nil, {
                    focusable = false,
                    close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
                    border = 'rounded',
                    source = 'always',
                    prefix = ' ',
                })
            end
        })
    end,
})


-- Habilitar autocompletado global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Languages
require('plugins.lsp.eslint')
require('plugins.lsp.ts_ls')
require('plugins.lsp.cpp')
require('plugins.lsp.jdtls')
-- require('plugins.lsp.cssls')
require('plugins.lsp.html')

-- Diagnostics
require('plugins.lsp.diagnostics')

-- CMP
require('plugins.cmp.init')
