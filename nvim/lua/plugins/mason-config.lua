
require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  -- Lista de servidores de lenguaje que deseas instalar automáticamente
  ensure_installed = {
    "lua_ls",       -- Lua
    "pyright",      -- Python
    "ts_ls",        -- TypeScript/JavaScript
    "clangd",       -- C/C++
    "bashls",       -- Bash
    "html",         -- HTML
    "cssls",        -- CSS
    "jsonls",       -- JSON
    "yamlls",       -- YAML
  },
})
