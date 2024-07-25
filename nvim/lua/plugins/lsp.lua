require('mason').setup()
require('mason-lspconfig').setup()
local lspconfig = require('lspconfig')

local extend_lspconfig = function(config, user_config)
  local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
  local custom_capabilities = vim.tbl_get(user_config, 'capabilities')

  config.capabilities = vim.tbl_deep_extend(
    'force',
    config.capabilities,
    cmp_capabilities,
    custom_capabilities or {}
  )
end

lspconfig.util.on_setup = lspconfig.util.add_hook_after(
  lspconfig.util.on_setup,
  extend_lspconfig
)

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)

    local mopts = {buffer = event.buf, silent = true, noremap = true }
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', mopts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', mopts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', mopts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', mopts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', mopts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', mopts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', mopts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', mopts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', mopts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', mopts)
  end,
})

require('lspconfig').pyright.setup({})
require('lspconfig').pylsp.setup({})
require('lspconfig').bashls.setup({})

local cmp = require('cmp')
cmp.setup({
    sources = cmp.config.sources(
        { { name = 'nvim_lsp' } }
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
    snippet = {
        expand = function(args)
        vim.snippet.expand(args.body)
        end,
    },
})

require('lsp_signature').setup({
    bind = true,
    hi_parameter = 'BufferCurrentTarget',
    hint_enable = false,
})

SeveritySigns = {
    [vim.diagnostic.severity.ERROR] = '󰏃',
    [vim.diagnostic.severity.WARN] = '󰔶',
    [vim.diagnostic.severity.HINT] = '󰌵',
    [vim.diagnostic.severity.INFO] = '',
}

vim.diagnostic.config({
    severity_sort = true,
    signs = false,
    float = { border = 'rounded', source = 'always' },
    virtual_text = {
        prefix = function(diagnostic) return SeveritySigns[diagnostic.severity] end,
    },
})

vim.fn.sign_define('DiagnosticSignError', {text=SeveritySigns[vim.diagnostic.severity.ERROR], icon=SeveritySigns[vim.diagnostic.severity.ERROR]})
vim.fn.sign_define('DiagnosticSignWarn',  {text=SeveritySigns[vim.diagnostic.severity.WARN], icon=SeveritySigns[vim.diagnostic.severity.WARN]})
vim.fn.sign_define('DiagnosticSignInfo',  {text=SeveritySigns[vim.diagnostic.severity.HINT], icon=SeveritySigns[vim.diagnostic.severity.HINT]})
vim.fn.sign_define('DiagnosticSignHint',  {text=SeveritySigns[vim.diagnostic.severity.INFO], icon=SeveritySigns[vim.diagnostic.severity.INFO]})
