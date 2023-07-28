local telescope = require('telescope')
local builtin = require('telescope.builtin')
local action = require('telescope.actions')
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
        buffers = {
            mappings = {
                i = {
                    ['<DEL>'] = action.delete_buffer
                },
                n = {
                    ['<DEL>'] = action.delete_buffer,
                    ['d'] = action.delete_buffer
                }
            }
        },
        live_grep = {
            disable_coordinates = true,
        },
        grep_string = {
            disable_coordinates = true,
        },
        treesitter = {
            show_line = false,
        },
    },
})

vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

-- Standard keymap overrides
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { noremap = true, silent = true})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'z=', builtin.spell_suggest)

-- files
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '\\%', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '\\*', builtin.grep_string, {})

-- file contents
vim.keymap.set('n', '\\\\', builtin.live_grep, {})
vim.keymap.set('n', '<leader>\\\\', function() builtin.live_grep({ grep_open_files = true }) end, {})
vim.keymap.set('n', '\\t', builtin.treesitter, {})
vim.keymap.set('n', '\\d', builtin.diagnostics, {})
vim.keymap.set('n', '\\D', function() builtin.diagnostics({ root_dir = true }) end, {})

-- Symbols
vim.keymap.set('n', '\\a', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '\\A', builtin.lsp_workspace_symbols, {})
vim.keymap.set('n', '\\v', function() builtin.lsp_document_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end, {})
vim.keymap.set('n', '\\V', function() builtin.lsp_workspace_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end, {})
vim.keymap.set('n', '\\l', function() builtin.lsp_document_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end, {})
vim.keymap.set('n', '\\L', function() builtin.lsp_workspace_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end, {})
vim.keymap.set('n', '\\c', function() builtin.lsp_document_symbols({symbols = 'class'}) end, {})
vim.keymap.set('n', '\\C', function() builtin.lsp_workspace_symbols({symbols = 'class'}) end, {})
vim.keymap.set('n', '\\f', function() builtin.lsp_document_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end, {})
vim.keymap.set('n', '\\F', function() builtin.lsp_workspace_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end, {})
vim.keymap.set('n', '\\m', function() builtin.lsp_document_symbols({symbols = 'module'}) end, {})
vim.keymap.set('n', '\\M', function() builtin.lsp_workspace_symbols({symbols = 'module'}) end, {})

-- vim
vim.keymap.set('n', '<leader><Tab>', builtin.buffers, {})
vim.keymap.set('n', '<leader>\\?', builtin.search_history, {})
vim.keymap.set('n', '<leader>\\r', builtin.registers, {})
vim.keymap.set('n', '<leader>\\:', builtin.command_history, {})
vim.keymap.set('n', '<leader>\\<F1>', builtin.help_tags, {})
vim.keymap.set('n', '<leader>\\m', builtin.marks, {})
vim.keymap.set('n', '<leader>\\h', builtin.highlights, {})
vim.keymap.set('n', '<leader>\\q', builtin.quickfix, {})
vim.keymap.set('n', '<leader>\\k', builtin.keymaps, {})

-- terminal
vim.keymap.set('n', '\\T', builtin.man_pages, {})

-- git
vim.keymap.set('n', '<C-p>', function() builtin.git_files({ show_untracked = true }) end, {})
vim.keymap.set('n', '\\g', builtin.git_bcommits, {})
vim.keymap.set('v', '\\g', builtin.git_bcommits_range, {})
vim.keymap.set('n', '\\G', builtin.git_commits, {})
vim.keymap.set('n', '\\B', builtin.git_branches, {})

-- extensiosn
vim.keymap.set('n', '\\n', telescope.extensions.notify.notify, {noremap = true, silent = true})

