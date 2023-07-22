local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.rust_analyzer.setup({})

lsp.setup()

local lsp_signature = require("lsp_signature")
lsp_signature.setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    },
})

local cmp = require('cmp')
local cmp_action = lsp.cmp_action()

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '',
                buffer = 'Ω',
                path = '󰆓',
                nvim_lua = 'Π',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
});

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

