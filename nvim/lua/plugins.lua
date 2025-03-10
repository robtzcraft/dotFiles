-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {	
  -- ColorScheme
  'shaunsingh/nord.nvim',
  'ellisonleao/gruvbox.nvim',
  
  -- SyntaxScheme (improvement)
  'nvim-treesitter/nvim-treesitter',

  -- StatusLine
  'nvim-lualine/lualine.nvim',
  
  -- Icons
  'nvim-tree/nvim-web-devicons',
  
  -- Tree
  'nvim-tree/nvim-tree.lua',							-- nvim-tree

  -- LSP stuff
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
}

-- Options
local opts = { }

-- lazy startup function
require('lazy').setup(plugins, opts)
