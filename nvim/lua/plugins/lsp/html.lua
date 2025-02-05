-- Configuración específica para CSS

local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
  oc_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    css = {
      validate = true,
    },
    completions = {
      completeFunctionCalls = true,
    },
    diagnostics = {
      enable = true,
    }
  }
})

-- Configuración específica para HTML
lspconfig.html.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    html = {
      autoClosingTags = true,
      suggest = {
        enabled = true,
      },
    },
    completions = {
      completeFunctionCalls = true,
    },
    diagnostics = {
      enable = true,
    }
  },
})
