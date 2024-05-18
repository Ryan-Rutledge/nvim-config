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
                ensure_installed = {},
                handlers = {
                    function(server)
                        lspconfig[server].setup({ capabilities = lsp_capabilities })
                    end,
                    lua_ls = function() lspconfig.lua_ls.setup({}) end,
                    pylsp = function() lspconfig.pylsp.setup({}) end,
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

            vim.diagnostic.config({
                virtual_text = false,
                severity_sort = true,
                float = { border = 'rounded', source = 'always' },
            })

            vim.fn.sign_define('DiagnosticSignError', {icon='󰏃', text='󰏃', texthl='DiagnosticError'})
            vim.fn.sign_define('DiagnosticSignWarn', {icon='󰔶', text='󰔶', texthl='DiagnosticWarn'})
            vim.fn.sign_define('DiagnosticSignInfo', {icon='󰌵', text='󰌵', texthl='DiagnosticInfo'})
            vim.fn.sign_define('DiagnosticSignHint', {icon='', text='', texthl='DiagnosticHint'})
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
