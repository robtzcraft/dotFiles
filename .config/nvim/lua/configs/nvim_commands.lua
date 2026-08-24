
-- New Commands
vim.api.nvim_create_user_command(
    'Greet',
    function( )
        print( "Hello from your command" )
    end,
    { desc = "Print a salute" }
)
