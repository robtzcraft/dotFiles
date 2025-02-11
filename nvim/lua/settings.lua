local opt = vim.opt
local o = vim.o
local g = vim.g

-- Options
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"
opt.wrap = false

-- LSP
vim.opt.pumheight = 15

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = false
o.numberwidth = 1
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

vim.api.nvim_create_user_command('OpenTerminal', function()
    -- Abrir una ventana horizontal dividida en la parte inferior
    vim.cmd('belowright split')  -- Divide la ventana horizontalmente
    vim.cmd('resize 10')         -- Establece el tamaño de la ventana a 10 renglones
    vim.cmd('terminal')          -- Abre una terminal en la ventana inferior
end, {})
