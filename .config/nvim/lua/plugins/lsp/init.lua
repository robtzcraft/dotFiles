
-- Habilitar autocompletado global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Servers/Diagnostics
require('plugins.lsp.lang_settings')
require('plugins.lsp.diagnostics')

-- CMP
require('plugins.cmp.init')
