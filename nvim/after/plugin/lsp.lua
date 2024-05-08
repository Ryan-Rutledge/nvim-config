-- lsp
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server)
            lspconfig[server].setup({ capabilities = lsp_capabilities })
        end,
        lua_ls = function() lspconfig.lua_ls.setup({}) end,
        pylsp = function() lspconfig.pylsp.setup({}) end,
    },
})

-- cmp
local cmp = require('cmp')
cmp.setup({
    sources = cmp.config.sources(
        { { name = 'nvim_lsp' } },
        { { name = 'buffer' } }
    ),
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.replace,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                buffer = 'Ω',
                path = '󰆓',
                nvim_lua = 'Π',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

require('lsp_signature').setup({
            bind = true,
    hi_parameter = 'BufferCurrentTarget',
    floating_window_off_y = -2,
    hint_enable = false,
    floating_window_above_cur_line = false,
})

-- diagnostics
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

vim.fn.sign_define('DiagnosticSignError', {icon='󰏃', text='󰏃', texthl='DiagnosticError'})
vim.fn.sign_define('DiagnosticSignWarn', {icon='󰔶', text='󰔶', texthl='DiagnosticWarn'})
vim.fn.sign_define('DiagnosticSignInfo', {icon='󰌵', text='󰌵', texthl='DiagnosticInfo'})
vim.fn.sign_define('DiagnosticSignHint', {icon='', text='', texthl='DiagnosticHint'})
