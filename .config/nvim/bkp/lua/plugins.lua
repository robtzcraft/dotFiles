--If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
--add the following snippet (which is due to @Iron-E) somewhere in your config before your first usage of packer:

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


return require('packer').startup{function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { -- A collection of common configurations for Neovim's built-in language server client
          'neovim/nvim-lspconfig',
          config = [[ require('plugins/lspconfig') ]]
  }
  use {
          'williamboman/nvim-lsp-installer',
          config = [[ require('plugins/lsp_installer_nvim') ]]
  }
  use { -- vscode-like pictograms for neovim lsp completion items Topics
          'onsails/lspkind-nvim',
          config = [[ require('plugins/lspkind') ]]
  }
  use { -- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in the Neovim statusline
          'nvim-lua/lsp-status.nvim',
          config = [[ require('plugins/lspstatus') ]]
  }


end, config = {
  -- Move to lua dir so impatient.nvim can cache it
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'

  }
}
