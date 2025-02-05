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
	
  'shaunsingh/nord.nvim',
  'ellisonleao/gruvbox.nvim',							-- Colorscheme
	'beauwilliams/statusline.lua',					-- Statusline
	'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',							-- nvim-tree
  -- 'romgrk/barbar.nvim',
  'akinsho/bufferline.nvim',

  -- LSP stuff
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'saadparwaiz1/cmp_luasnip'
}

-- Options
local opts = { }

-- lazy startup function
require('lazy').setup(plugins, opts)
