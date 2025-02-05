-- cmp/init.lua
local cmp = require('cmp')
local luasnip = require('luasnip')

local kind_icons = {
    Text = "",  -- Texto
    Method = "󰆧",  -- Método
    Function = "󰊕",  -- Función
    Constructor = "",  -- Constructor
    Field = "󰇽",  -- Campo
    Variable = "󰫧",  -- Variable
    Class = "󰠱",  -- Clase
    Interface = "",  -- Interfaz
    Module = "",  -- Módulo
    Property = "󰜢",  -- Propiedad
    Unit = "",  -- Unidad
    Value = "󰎠",  -- Valor
    Enum = "",  -- Enumeración
    Keyword = "󰌋",  -- Palabra clave
    Snippet = "",  -- Snippet
    Color = "󰏘",  -- Color
    File = "󰈙",  -- Archivo
    Reference = "󰈇",  -- Referencia
    Folder = "󰉋",  -- Carpeta
    EnumMember = "",  -- Miembro de enumeración
    Constant = "󰏿",  -- Constante
    Struct = "󰙅",  -- Estructura
    Event = "",  -- Evento
    Operator = "󰆕",  -- Operador
    TypeParameter = "󰅲",  -- Parámetro de tipo
}

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- No usar <C-y> para confirmar
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),  -- Cancelar autocompletado
            c = cmp.mapping.close(),  -- Cerrar la ventana de autocompletado
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirmar con Enter
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()  -- Seleccionar la siguiente opción
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()  -- Expandir snippet o saltar al siguiente placeholder
            else
                fallback()  -- Comportamiento por defecto de <Tab>
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()  -- Seleccionar la opción anterior
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)  -- Saltar al placeholder anterior
            else
                fallback()  -- Comportamiento por defecto de <S-Tab>
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- Autocompletado de LSP
        { name = 'luasnip' },  -- Snippets
    }),
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered({
        border = 'rounded',
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      }),
    },
    view = {
      entries = { name = 'custom', selection_order = 'near_cursor' },
    },
    formatting = {
      fields = { 'abbr', 'kind' },
      format = function(entrym, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    },
})


-- Snippets
-- cmp/snippets.lua
local luasnip = require('luasnip')

-- Configurar snippets para React
luasnip.add_snippets('javascript', {
    luasnip.snippet('rfc', {
        luasnip.text_node('import React from "react";'),
        luasnip.text_node(''),
        luasnip.text_node('const Component = () => {'),
        luasnip.text_node('  return ('),
        luasnip.text_node('    <div>'),
        luasnip.text_node('      {/* Your code here */}'),
        luasnip.text_node('    </div>'),
        luasnip.text_node('  );'),
        luasnip.text_node('};'),
        luasnip.text_node(''),
        luasnip.text_node('export default Component;'),
    }),
})

-- Cpp
luasnip.add_snippets('cpp', {
  luasnip.snippet('main', {
    luasnip.text_node('#include <iostream>'),
      luasnip.text_node(''),
      luasnip.text_node('int main() {'),
      luasnip.text_node('    std::cout << "Hello, World!" << std::endl;'),
      luasnip.text_node('    return 0;'),
      luasnip.text_node('}'),
  })
})
