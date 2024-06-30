local telescope = require('telescope')
local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
local builtin = require('telescope.builtin')

telescope.setup({
    theme = 'tokyonight',
    defaults = {
        prompt_prefix = '   ',
        layout_strategy = 'horizontal',
        mappings = {
            n = {
                ['<A-p>'] = layout.toggle_preview,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<C-l>'] = actions.smart_send_to_loclist + actions.open_loclist,
            },
            i = {
                ['<A-p>'] = layout.toggle_preview,
                ['<A-k>'] = actions.cycle_previewers_prev,
                ['<A-j>'] = actions.cycle_previewers_next,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<C-l>'] = actions.smart_send_to_loclist + actions.open_loclist,
            },
        },
        path_display = {
            filename_first = { reverse_directories = true }
        },
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
    extensions = {
        file_browser = {
            hide_parent_dir = true,
            follow_symlinks = true,
            prompt_path = true,
        },
        live_grep_args = {
            mappings = {
                i = {
                    ['<C-k>'] = require('telescope-live-grep-args.actions').quote_prompt(),
                    ['<C-i>'] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = ' --iglob ' }),
                },
            },
        }
    },
    pickers = {
        git_files = {
            mappings = {
                i = { ['<CR>'] = actions.select_drop, },
                n = { ['<CR>'] = actions.select_drop, },
            }
        },
        buffers = {
            mappings = {
                i = { ['<CR>'] = actions.select_drop, ['<DEL>'] = actions.delete_buffer, },
                n = { ['<CR>'] = actions.select_drop, ['d'] = actions.delete_buffer, },
            }
        },
        live_grep = { disable_coordinates = true, },
        grep_string = { disable_coordinates = true, },
        treesitter = { show_line = false, },
    },
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopePreviewerLoaded',
    callback = function(_) vim.opt_local.number = true end
})

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', 'gi', builtin.lsp_implementations, mopts)
vim.keymap.set('n', 'gr', builtin.lsp_references, mopts)
vim.keymap.set('n', 'z=', builtin.spell_suggest, mopts)
vim.keymap.set('n', '\\%', builtin.current_buffer_fuzzy_find, mopts)
vim.keymap.set('n', '\\*', builtin.grep_string, mopts)
vim.keymap.set('n', '\\b', function() builtin.live_grep({ grep_open_files = true }) end, mopts)
vim.keymap.set('n', '\\<BS>', builtin.resume, mopts)
vim.keymap.set('n', '\\d', builtin.diagnostics, mopts)
vim.keymap.set('n', '\\a', builtin.lsp_document_symbols, mopts)
vim.keymap.set('n', '\\n', function() builtin.lsp_document_symbols({symbols = {'namespace'}}) end, mopts)
vim.keymap.set('n', '\\c', function() builtin.lsp_document_symbols({symbols = 'class'}) end, mopts)
vim.keymap.set('n', '\\f', function() builtin.lsp_document_symbols({symbols = {'function', 'method', 'constructor', 'property'}}) end, mopts)
vim.keymap.set('n', '\\v', function() builtin.lsp_document_symbols({symbols = {'variable', 'field', 'parameter', 'constant'}}) end, mopts)
vim.keymap.set('n', '\\q', builtin.quickfix, mopts)
vim.keymap.set('n', '\\l', builtin.loclist, mopts)
vim.keymap.set('n', '<leader><Tab>', builtin.buffers, mopts)
vim.keymap.set('n', '<leader>\\?', builtin.search_history, mopts)
vim.keymap.set('n', '<leader>\\r', builtin.registers, mopts)
vim.keymap.set('n', '<leader>\\:', builtin.command_history, mopts)
vim.keymap.set('n', '<leader>\\<F1>', builtin.help_tags, mopts)
vim.keymap.set('n', '<leader>\\m', builtin.marks, mopts)
vim.keymap.set('n', '<leader>\\h', builtin.highlights, mopts)
vim.keymap.set('n', '<leader>\\k', builtin.keymaps, mopts)
vim.keymap.set('n', '\\m', builtin.man_pages, mopts)
vim.keymap.set('n', '<C-p>', function() builtin.git_files({ use_file_path = true, show_untracked = true }) end, mopts)
vim.keymap.set('n', '\\G', builtin.git_commits, mopts)
vim.keymap.set('n', '\\B', builtin.git_branches, mopts)
vim.keymap.set('n', '\\g', builtin.git_bcommits, mopts)
vim.keymap.set('v', '\\g', builtin.git_bcommits_range, mopts)
vim.keymap.set('n', '<leader>f', builtin.find_files, mopts)
vim.keymap.set('n',
    '<leader>F',
    function() telescope.extensions.file_browser.file_browser({
        path = '%:p:h',
        select_buffer = true,
        hidden = true,
        follow_symlinks = true,
    }) end
, mopts)
vim.keymap.set('n', '\\<Tab>', function() builtin.git_files({ git_command = { 'git', 'diff', '--name-only', '--merge-base main' } }) end, mopts)
vim.keymap.set('n', '\\<S-Tab>', function() builtin.git_files({ git_command = { 'git', 'diff', '--name-only', '--merge-base master' } }) end, mopts)
vim.keymap.set('n',
    '\\\\',
    function()
        local args = {}
        local gitdir = vim.fn.finddir('.git', vim.fn.expand '%:p:p' .. ';')
        if gitdir ~= '' then
            local repodir = require('plenary').path:new(gitdir):parent():absolute()
            args = { search_dirs = { repodir } }
        end

        telescope.extensions.live_grep_args.live_grep_args(args)
    end
, mopts)
