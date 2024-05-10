return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
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
    {
        'ray-x/lsp_signature.nvim',
        event = 'InsertEnter',
        opts = {
            bind = true,
            hi_parameter = 'BufferCurrentTarget',
            floating_window_off_y = -2,
            hint_enable = false,
            floating_window_above_cur_line = false,
        },
    }
}
