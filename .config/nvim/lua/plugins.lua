
vim.pack.add( {

    { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
    { src = 'https://github.com/shaunsingh/nord.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
    { src = 'https://github.com/romgrk/barbar.nvim' },

    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },

    -- LSP
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },
--    { src = 'https://github.com/hrsh7th/nvim-cmp' },
--    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/windwp/nvim-autopairs' },
--    { src = 'https://github.com/saadparwaiz1/cmp_luasnip' }

} )

-- Theme
require( 'plugins.lualine' )
require( 'plugins.nvimtree' )
require( 'plugins.barbar' )

require( 'plugins.lsp.mason' )
require( 'plugins.lsp.blink' )
require( 'plugins.lsp.lspconfig' )
require( 'plugins.lsp.autopairs' )

