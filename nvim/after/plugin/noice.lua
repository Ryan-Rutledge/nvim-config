require('noice').setup({
    lsp = {
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
        hover = {
            silent = false
        },
    },
    messages = {
        enabled = false,
        view = 'messages',
        view_search = false,
    },
    presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
    cmdline = {
        format = {
            search_down = { icon = ' ' },
            search_up = { icon = '  ' },
        }
    }
})

