require('base')

--If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
--add the following snippet (which is due to @Iron-E) somewhere in your config before your first usage of packer:
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end


return require('packer').startup { function()

  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    config = [[ require('plugins/lspconfig') ]]
  }
  use {
    'williamboman/nvim-lsp-installer',
    config = [[ require('plugins/lsp_installer_nvim') ]]
  }
  use {
    'onsails/lspkind-nvim',
    config = [[ require('plugins/lspkind') ]]
  }
  use {
    'nvim-lua/lsp-status.nvim',
    config = [[ require('plugins/lspstatus') ]]
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      "hrsh7th/cmp-nvim-lsp",     -- nvim-cmp source for neovim builtin LSP client
      "hrsh7th/cmp-nvim-lua",     -- nvim-cmp source for nvim lua
      "hrsh7th/cmp-buffer",       -- nvim-cmp source for buffer words.
      "hrsh7th/cmp-path",         -- nvim-cmp source for filesystem paths.
      "hrsh7th/cmp-calc",         -- nvim-cmp source for math calculation.
      "saadparwaiz1/cmp_luasnip", -- luasnip completion source for nvim-cmp
    },
    config = [[ require('plugins/cmp') ]],
  }
  use { -- Snippet Engine for Neovim written in Lua.
    'L3MON4D3/LuaSnip',
    requires = {
      "rafamadriz/friendly-snippets", -- Snippets collection for a set of different programming languages for faster development.
    },
    config = [[ require('plugins/luasnip') ]],
  }

  use { "ellisonleao/gruvbox.nvim" }

  end, config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
  }
}
