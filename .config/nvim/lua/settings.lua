
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
opt.backupcopy = "yes"

-- Providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

g.allowrevins = true        -- Allows CTRL + _ while insert mode is active
g.autocomplete = true

--  Keymaps
--  vim.keymap.set( { modes }, { lhs }, { rhs }, options )
--
--  Modes:
--      n: normal
--      i: insert
--      v: visual
--  lhs: custom keystroke ( e.g. <leader>w )

--  Leader
g.mapleader = ' '

--  Default keymaps deleted
--  vim.keymap.del( 'n', '<Tab>' )

--  UI keybinds
--  CTRL + Right    => Move to the next buffer
--  CTRL + Left     => Mode to previous buffer
--  CTRL + a        => Focus to NvimTree
--  CTRL + q        => Close current buffer

vim.keymap.set( { 'n', 'i' }, '<C-Right>', '<cmd>BufferNext<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-Left>', '<cmd>BufferPrevious<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-a>', '<cmd>NvimTreeFocus<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-q>', '<cmd>BufferClose<CR>', { remap = false } )

-- File Keybinds
vim.keymap.set( { 'n', 'i' }, '<C-z>', '<cmd>undo<CR>', { remap = false } )
vim.keymap.set( { 'n', 'i' }, '<C-s>', '<cmd>write<CR>', { remap = false } )

--  Commands
--  vim.api.nvim_create_user_command( { name }, { action } )
vim.api.nvim_create_user_command(
    'Greet',
    function( )
        print( 'Hello from your command' )
    end,
    { desc = 'Print a salute' }
)
vim.api.nvim_create_user_command(
    'Packs',
    function( opts )
        local param = opts.args
        if param == 'update' then
            vim.pack.update( )
        elseif param == 'delete' then
            os.execute( 'rm ~/.config/nvim/nvim-pack-lock.json' )
            os.execute( 'rm -rf ~/.local/share/nvim' )
            os.execute( 'rm -rf ~/.local/state/nvim' )
            os.execute( 'rm -rf ~/.cache/nvim' )
        else
            vim.api.nvim_echo( { { 'Error: Unkown command', 'ErrorMsg' } }, true, { } )
        end
    end,
    {
        nargs = 1,
        complete = function( ArgLead, CmdLine, CursorPos )
            local my_params = { 'update', 'delete' }

            return vim.tbl_filter( function( item )
                return vim.startswith( item, ArgLead )
            end, my_params )
        end,
    }
)
