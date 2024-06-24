return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            -- { "folke/neodev.nvim", opts = {} },
        },
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'clangd',
                    -- 'emmet_ls',
                    'lua_ls',
                    -- 'pyright',
                    -- 'rust_analyzer',
                    -- 'tailwindcss',
                    -- 'tsserver',
                },
                handlers = {
                    function(server)
                        lspconfig[server].setup({ capabilities = lsp_capabilities })
                    end,
                },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf, silent = true, noremap = true  }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('i', '<A-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
                    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
                end
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
        end
    },
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        opts = {},
        build = ':MasonUpdate',
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = 'VeryLazy',
        dependencies = { 'williamboman/mason.nvim' }
    },
}
