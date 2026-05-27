require('mason').setup()

local conform = require('conform')
vim.o.formatexpr = 'v:lua.require"conform".formatexpr()'
conform.setup({
    formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        lua = { 'stylua' },
        javascript = { 'prettier' },
        python = { 'ruff' },
        rust = { 'rustfmt' },
    },
    formatters = {
        stylua = {
            args = { '--indent-type', 'Spaces', '--indent-width', '4', '-'},
            prepend_args = { '--quote-style', 'AutoPreferSingle' },
        },
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

vim.lsp.config('clangd', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    on_attach = function(client, bufnr)
        require('lsp_signature').on_attach()
    end,
})
vim.lsp.enable('clangd')

local diagnostic_signs = {
    [vim.diagnostic.severity.ERROR] = '✘',
    [vim.diagnostic.severity.WARN]  = '󰔶',
    [vim.diagnostic.severity.INFO]  = '󰌵',
    [vim.diagnostic.severity.HINT]  = '',
}

vim.keymap.set({ 'n', 'x' }, '<F3>', function() conform.format({ async = true }) end, mopts)
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local mopts = { buffer = event.buf, silent = true, noremap = true }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, mopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, mopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, mopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, mopts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, mopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, mopts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, mopts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, mopts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, mopts)

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
