local telescope = require('telescope')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local action_layout = require('telescope.actions.layout')

telescope.setup({
    theme = 'tokyonight',
    defaults = {
        prompt_prefix = "   ",
        layout_strategy = 'center',
        mappings = {
            n = {
                ['<A-p>'] = action_layout.toggle_preview,
            },
            i = {
                ['<A-p>'] = action_layout.toggle_preview,
            },
        },
        path_display = {"truncate"},
        winblend = 0,
        border = true,
        color_devicons = true,
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        show_line = false,
        trim_text = true,
    },
    pickers = {
        live_grep = {
            disable_coordinates = true,
        },
        grep_string = {
            disable_coordinates = true,
        },
        treesitter = {
            show_line = false,
        }
    },
})

vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"


-- quick keys
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>r', builtin.registers, {})

-- files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>p', function()
    builtin.find_files({ cwd = utils.buffer_dir() })
end)
vim.keymap.set('n', '<leader>P', builtin.find_files, {})
vim.keymap.set('n', '<leader>F', builtin.live_grep, {})

vim.keymap.set('n', 'z=', builtin.spell_suggest)
vim.keymap.set('n', '<leader>//', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>/?', builtin.search_history, {})
vim.keymap.set('n', '<leader>/*', builtin.grep_string, {})
vim.keymap.set('n', '<leader>/f',
    function() builtin.live_grep({ grep_open_files = true}) end,
    {}
)
vim.keymap.set('n', '<leader>/o', builtin.treesitter, {})
vim.keymap.set('n', '<leader>/s', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>/S', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '<leader>/r', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>/i', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>/d', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>/D', function() builtin.diagnostics({ bufnr = nil }) end, {})

-- vim-specific
vim.keymap.set('n', '<leader>/:', builtin.commands, {})
vim.keymap.set('n', '<leader>/<F1>', builtin.help_tags, {})
vim.keymap.set('n', '<leader>/m', builtin.marks, {})
vim.keymap.set('n', '<leader>/h', builtin.highlights, {})
vim.keymap.set('n', '<leader>/q', builtin.quickfix, {})
vim.keymap.set('n', '<leader>/k', builtin.keymaps, {})

-- terminal-specific
vim.keymap.set('n', '<leader>/M', builtin.man_pages, {})

