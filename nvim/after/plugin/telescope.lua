local telescope = require('telescope')
local builtin = require('telescope.builtin')
local action = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
local plenary = require('plenary')

telescope.setup({
    theme = 'tokyonight',
    defaults = {
        prompt_prefix = '   ',
        layout_strategy = 'center',
        mappings = {
            n = {
                ['<A-p>'] = action_layout.toggle_preview,
            },
            i = {
                ['<A-p>'] = action_layout.toggle_preview,
            },
        },
        path_display = {'truncate'},
        winblend = 0,
        border = true,
        color_devicons = true,
        multi_icon = ' ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        sorting_strategy = 'ascending',
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

telescope.load_extension('fzf')
telescope.load_extension('noice')

vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'

local opts = { noremap = true, silent = true }

-- Standard keymap overrides
vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
vim.keymap.set('n', 'z=', builtin.spell_suggest)

-- files
vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '\\%', builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set('n', '\\*', builtin.grep_string, opts)

-- file contents
vim.keymap.set('n', '\\\\', builtin.live_grep, opts)
vim.keymap.set(
    'n', '<leader>\\\\',
    function()
        local gitdir = vim.fn.finddir('.git', vim.fn.expand '%:p:p' .. ';')
        if gitdir == '' then
            return nil
        end

        local repodir = plenary.path:new(gitdir):parent():absolute()
        builtin.live_grep( { search_dirs = { repodir } })
    end,
    opts
)
vim.keymap.set('n', '\\b', function() builtin.live_grep({ grep_open_files = true }) end, opts)

-- vim.keymap.set('n', '\\t', builtin.treesitter, opts)
vim.keymap.set('n', '<BS>', builtin.resume, opts)
vim.keymap.set('n', '\\d', builtin.diagnostics, opts)
vim.keymap.set('n', '\\D', function() builtin.diagnostics({ root_dir = true }) end, opts)

-- Symbols
vim.keymap.set('n', '\\a', builtin.lsp_document_symbols, opts)
vim.keymap.set('n', '\\A', builtin.lsp_workspace_symbols, opts)
vim.keymap.set('n', '\\v', function() builtin.lsp_document_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end, opts)
vim.keymap.set('n', '\\V', function() builtin.lsp_workspace_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end, opts)
vim.keymap.set('n', '\\l', function() builtin.lsp_document_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end, opts)
vim.keymap.set('n', '\\L', function() builtin.lsp_workspace_symbols({symbols = {'object', 'string', 'character', 'float', 'number', 'boolean'}}) end, opts)
vim.keymap.set('n', '\\c', function() builtin.lsp_document_symbols({symbols = 'class'}) end, opts)
vim.keymap.set('n', '\\C', function() builtin.lsp_workspace_symbols({symbols = 'class'}) end, opts)
vim.keymap.set('n', '\\f', function() builtin.lsp_document_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end, opts)
vim.keymap.set('n', '\\F', function() builtin.lsp_workspace_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end, opts)
vim.keymap.set('n', '\\m', function() builtin.lsp_document_symbols({symbols = 'module'}) end, opts)
vim.keymap.set('n', '\\M', function() builtin.lsp_workspace_symbols({symbols = 'module'}) end, opts)

-- vim
vim.keymap.set('n', '\\q', builtin.quickfix, opts)
vim.keymap.set('n', '<leader><Tab>', builtin.buffers, opts)
vim.keymap.set('n', '<leader>\\?', builtin.search_history, opts)
vim.keymap.set('n', '<leader>\\r', builtin.registers, opts)
vim.keymap.set('n', '<leader>\\:', builtin.command_history, opts)
vim.keymap.set('n', '<leader>\\<F1>', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>\\m', builtin.marks, opts)
vim.keymap.set('n', '<leader>\\h', builtin.highlights, opts)
vim.keymap.set('n', '<leader>\\k', builtin.keymaps, opts)
vim.keymap.set('n', '<leader>\\n', ':NoiceTelescope<CR>', {noremap = true, silent = true})

-- terminal
-- vim.keymap.set('n', '\\T', builtin.man_pages, opts)

-- git
vim.keymap.set('n', '<C-p>', function() builtin.git_files({ show_untracked = true }) end, opts)
vim.keymap.set('n', '\\g', builtin.git_bcommits, opts)
vim.keymap.set('v', '\\g', builtin.git_bcommits_range, opts)
vim.keymap.set('n', '\\G', builtin.git_commits, opts)
vim.keymap.set('n', '\\B', builtin.git_branches, opts)

