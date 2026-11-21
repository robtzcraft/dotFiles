
local capabilities = require( 'blink.cmp' ).get_lsp_capabilities( )

local servers = { 'lua_ls', 'pyright', 'ts_ls', 'clangd', 'cmake', 'bashls' }
local diagnosticIcons = { Error = ' ', Warning = ' ', Hint = '󰛨 ', Info = ' ' }     -- Custom Icon:  

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
            [ vim.diagnostic.severity.ERROR ] = diagnosticIcons.Error,
            [ vim.diagnostic.severity.WARN ] = diagnosticIcons.Warning,
            [ vim.diagnostic.severity.HINT ] = diagnosticIcons.Hint,
            [ vim.diagnostic.severity.INFO ] = diagnosticIcons.Info,
        }
    }
} )

for type, icon in pairs( diagnosticIcons ) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define( hl, { text = icon, texthl = hl, numhl = hl } )
end
