local status,packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Color scheme (Gruvbox)
  use { "ellisonleao/gruvbox.nvim" }

  -- Status Line (Lualine)
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Auto-completion
  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v<CurrentMajor>.*",
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
end)
