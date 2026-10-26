
local capabilities = require( 'blink.cmp' ).get_lsp_capabilities( )

local servers = { 'lua_ls', 'pyright', 'ts_ls', 'clangd' }
local diagnosticIcons = { error = ' ', warning = ' ', hint = ' ', info = ' ' }
-- local diagnosticIcons = { error = ' ', warning = ' ', hint = '󰛨 ', info = ' ' }

for _, server in ipairs( servers ) do
    vim.lsp.config( server , {
        capabilities = capabilities
    } )
end

vim.diagnostic.config( {
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = ''
    },
    severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
    },
    signs = {
        text = {

            [ vim.diagnostic.severity.ERROR ] = diagnosticIcons.error,
            [ vim.diagnostic.severity.WARN ] = diagnosticIcons.warning,
            [ vim.diagnostic.severity.HINT ] = diagnosticIcons.hint,
            [ vim.diagnostic.severity.INFO ] = diagnosticIcons.info,
        }
    }
} )

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
