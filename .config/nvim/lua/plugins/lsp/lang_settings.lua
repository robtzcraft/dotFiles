local lspconfig = require('lspconfig')

-- HTML
-- {{{
lspconfig.html.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    html = {
      autoClosingTags = true,
      suggest = {
        enabled = true,
      },
    },
    completions = {
      completeFunctionCalls = true,
    },
    diagnostics = {
      enable = true,
    }
  },
})
-- }}}

-- CSS
-- {{{
lspconfig.cssls.setup({
  oc_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    css = {
      validate = true,
    },
    completions = {
      completeFunctionCalls = true,
    },
    diagnostics = {
      enable = true,
    }
  }
})
-- }}}

-- JS / Typescript / React
-- {{{
lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        -- Habilitar autocompletado
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keymaps para LSP
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
      completions = {
        completeFunctionCalls = true,
      },
      diagnostics = {
        enable = true,
      }
    }
})
-- }}}

-- JAVA
-- {{{
lspconfig.jdtls.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  cmd = {
    'java',  -- Ruta a tu instalación de Java
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xmx2G',
    '-jar', vim.fn.expand('~/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration', vim.fn.expand('~/.local/share/jdtls/config_linux'),  -- Cambia a `config_mac` o `config_win` según tu sistema
    '-data', vim.fn.expand('~/.local/share/jdtls/workspace') .. vim.fn.getcwd(),  -- Carpeta de trabajo
  },
})
-- }}}

-- C/C++
-- {{{
lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Habilitar autocompletado
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Keymaps para LSP
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--all-scopes-completion",
    "--completion-style=detailed",
  },
})
-- }}}

-- ESLINT
-- {{{
lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        -- Habilitar autocompletado
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Keymaps para LSP
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        eslint = {
            enable = true,  -- Habilitar ESLint
        },
    },
})
-- }}}

-- Python
-- {{{
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    eslint = {
      enable = true,
    },
  },
})
-- }}}

-- LUA
-- {{{
lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    eslint = {
      enable = true,
    },
  },
})
-- }}}
