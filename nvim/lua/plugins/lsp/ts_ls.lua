-- lsp/ts_server.lua
local lspconfig = require('lspconfig')

-- Configurar typescript-language-server (TypeScript/JavaScript)
lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        -- Habilitar autocompletado
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keymaps para LSP
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
      diagnostics = {
        enable = true,
      }
    }
})

-- lsp/html.lua
local lspconfig = require('lspconfig')

-- Configurar html-lsp (HTML)
lspconfig.html.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
})
