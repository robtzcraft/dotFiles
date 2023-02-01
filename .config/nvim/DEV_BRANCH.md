## Ingredients

Packer: 		Plugin manager for Neovim
Neosolarized:		A truecolor, solarized dark coloscheme (Replaced for Gruvbox and custom colors)
lualine: 		StatusLine
lspkind-nvim:		VSCode-like pictograms
LuaSnip:		Snippet engine
nvim-cmp: 		Completion Engine plugin
cmp-nvim-lsp		nvim-cmp source for built-in LSP
cmp-buffer		nvim-cmp source for buffer words
nvim-lspconfig		Neovim's built-in LSP configuration set
null-ls.nvim:		Use Neovim as a language server
prettier.nvim:		Portable package manager for LSP servers, DAP servers, linters, and formatters
mason-lspconfig.nvim:	Lspconfig extension for mason.nvim
lspsaga.nvim:		A highly performant UI for LSP
nvim-treesitter:	Treesitter configurations and abstraction layer
nvim-web-devicons:	Lua for of vim-web-devicons
telescope.nvim:		A highly extendable fuzzy finder over list
telescope-file-browser.nvim:		File Browser extension for Telescope
nvim-autopais:		Autopairs


## Directory Structure

Neovim conforms XDG Base Directory structure. Here is my config file structure:

```

```

Neovim loads $HOME/.config/nvim/init.vim or init.lua first instead of $HOME/.vimrc.
Check out the quickstart guide for more detail:
