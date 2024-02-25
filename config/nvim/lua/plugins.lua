
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
  'ellisonleao/gruvbox.nvim',
  'sainnhe/everforest',
  'beauwilliams/statusline.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  'alexghergh/nvim-tmux-navigation',


  -- Autocompletion
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  'hrsh7th/nvim-cmp',		 	-- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp',		-- LSP source for nvim-cmp
  'saadparwaiz1/cmp_luasnip',		-- Snippets source for nvim-cmp
  'L3MON4D3/LuaSnip'
}

-- Options
local opts = { }

-- lazy startup function
require('lazy').setup(plugins, opts)


