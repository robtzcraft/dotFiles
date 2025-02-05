-- plugins/cssls.lua
return {
  {
    "neovim/nvim-lspconfig",
    ft = "css",  -- Cargar solo para archivos CSS
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.cssls.setup({
        on_attach = function(client, bufnr)
          -- Mapeos personalizados para LSP
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
        settings = {
          css = {
            validate = true,  -- Habilitar validación de CSS
          },
        },
      })
    end,
  },
}
