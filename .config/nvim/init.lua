
---------------------------------
--    Robt'z Neovim Configs    --
--  github.com/robtz/dotFiles  -- 
---------------------------------

-- Preload modules
if vim.loader then
    vim.loader.enable( )
end

require( 'plugins' )
require( './settings' )
