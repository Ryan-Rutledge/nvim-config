require('blink.cmp').setup({
    snippets = { preset = 'default', },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' }, },
    completion = {
        documentation  = {
            auto_show = true,
            auto_show_delay_ms = 800,
        },
        ghost_text = { enabled = true },
        menu = { direction_priority = { 'n', 's' } },
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
    },
    keymap = {
        preset = 'enter',
        ['<Tab>'] = { function(cmp) if cmp.is_visible() then return cmp.select_next() end end, 'fallback' },
        ['<S-Tab>'] = { function(cmp) if cmp.is_visible() then return cmp.select_prev() end end, 'fallback' },
    },
})
