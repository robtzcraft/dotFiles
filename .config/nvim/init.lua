
-- Last review: May/26 ( 0.12.2 )

-- Preload modules
if vim.loader then
    vim.loader.enable()
end

require( './base' )

require( './settings' )           -- IDE s

require( 'plugins' )
--require( './plugins/mason-config' )
require( './plugins/gruvbox' )
require( './plugins/lualine' )

--require( './plugins/lsp/init' )
require( './plugins/nvimtree' )
require( './plugins/barbar' )
