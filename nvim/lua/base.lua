
local opt = vim.opt
local o = vim.o
local g = vim.g

-- Options [vim.opt]
o.laststatus = 3
o.showmode = false
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"
o.expandtab = true
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.number = true
o.numberwidth = 1
o.ruler = false

opt.wrap = false

-- Providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
