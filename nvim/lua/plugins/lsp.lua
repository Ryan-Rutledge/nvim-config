require('mason').setup()

local conform = require('conform')
vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
conform.setup({
    formatters_by_ft = {
        python = { 'black' },
        javascript = { 'prettier' },
        rust = { 'rustfmt' },
    },
})

vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    -- root_markers = { 'pyrightconfig.json', 'pyproject.toml', '.git' },
})
vim.lsp.enable('pyright')

vim.lsp.config('eslint', {
    filetypes = { 'javascript', 'typescript' },
    root_markers = { '.eslintrc', 'package.json', '.git' },
})
vim.lsp.enable('eslint')

vim.lsp.config('lua_ls', {})
vim.lsp.enable('lua_ls')

local diagnostic_signs = {
    [vim.diagnostic.severity.ERROR] = '✘',
    [vim.diagnostic.severity.WARN]  = '󰔶',
    [vim.diagnostic.severity.INFO]  = '󰌵',
    [vim.diagnostic.severity.HINT]  = '',
}

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local mopts = { buffer = event.buf, silent = true, noremap = true }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', mopts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', mopts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', mopts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', mopts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', mopts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', mopts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', mopts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', mopts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function() conform.format({ async = true }) end, mopts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', mopts)

        local virtual_lines_config = {
            virtual_lines = {
                format = function(diagnostic)
                    return diagnostic_signs[diagnostic.severity] .. ' ' .. diagnostic.message
                end,
                current_line = true,
            }
        }

        local remove_virtual_lines_config = {
            once = true,
            callback = function()
                vim.diagnostic.config({ virtual_lines = false })
            end,
        }

        local jump_handler = function(diagnostic)
            vim.diagnostic.config(virtual_lines_config)
            vim.api.nvim_create_autocmd('CursorMoved', remove_virtual_lines_config)
        end

        vim.keymap.set('n', 'gl', jump_handler, mopts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = false, on_jump = jump_handler }) end, mopts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = false, on_jump = jump_handler }) end, mopts)
    end,
})

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
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
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


vim.diagnostic.config({
    severity_sort = true,
    float = { border = 'rounded', source = 'always' },
    virtual_text = false,
    -- virtual_text = {
        --     prefix = function(diagnostic)
            --         return diagnostic_signs[diagnostic.severity]
            --     end,
            -- },
            signs = {
                text = diagnostic_signs,
            }
        })
