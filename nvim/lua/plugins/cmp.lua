return {
    {
        'hrsh7th/nvim-cmp',
        event = 'VeryLazy',
        config = function()
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
            })
        end
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        dependencies = { 'hrsh7th/nvim-cmp' },
        event = 'VeryLazy',
    },
    {
        'ray-x/lsp_signature.nvim',
        event = 'BufReadPre',
        opts = {
            bind = true,
            hi_parameter = 'BufferCurrentTarget',
            hint_enable = false,
        },
    }
}
