local snacks = require('snacks')

snacks.setup({
    bigfile = { enabled = true },
    explorer = {
        replace_netrw = true,
        trash = true,
    },
    indent = { enabled = false },
    input = { enabled = true, position = 'float' },
    scroll = { enabled = false },
    picker = {
        enabled = true,
        layout = { preset = 'ivy', layout = { border = false } },
        sources = {
            explorer = {
                layout = { layout = { border = false, preview = true } }, 
                auto_close = true, 
            },
            git_log = { focus = 'list', layout = { fullscreen = true } },
            git_log_file = { focus = 'list', layout = { fullscreen = true } },
            ['git_files_changed'] = {
                title = 'Changed Files',
                finder = 'proc',
                cmd = 'git',
                args = { 'diff', '--name-only', '--merge-base', '--relative', 'main' },
                format = 'file',
                preview = 'file',
                transform = function(item)
                    item.file = item.text
                end,
            },
            ['git_files_untracked'] = {
                title = 'Untracked Files',
                finder = 'proc',
                cmd = 'git',
                args = { 'ls-files', '--others' },
                format = 'file',
                preview = 'file',
                transform = function(item)
                    item.file = item.text
                end,
            },
            ['git_diff_changed'] = {
                title = 'Files Changed Diff',
                finder = 'git',
                args = { 'diff', '--name-only', '--merge-base', 'main' },
                format = 'file',
                preview = 'git_diff',
                confirm = 'goto_file',
            },
        },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = {
        enabled = true,
        win = { style = 'float' },
    },
    words = { enabled = true },
})
vim.ui.input = Snacks.input.input

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '\\<BS>', function() Snacks.picker.resume() end, mopts)
vim.keymap.set('n', '<C-p>', function() 
    if Snacks.git.get_root() then
        Snacks.picker.git_files({ untracked = true })
    else
        Snacks.picker.files()
    end
end, mopts)
vim.keymap.set('n', '\\\\', function()
    if Snacks.git.get_root() then
        Snacks.picker.git_grep({ untracked = true })
    else
        Snacks.picker.grep({ dirs = { '.' } })
    end
end, mopts)
vim.keymap.set('n', '<leader><Tab>', function() Snacks.picker.buffers({
    current = false,
    sort_lastused = true,
}) end, mopts)
vim.keymap.set('n', '<leader>\\', function() Snacks.picker.pickers() end, mopts)
vim.keymap.set('n', '<leader>F', function() Snacks.explorer.reveal() end, mopts)
vim.keymap.set('n', '<leader>f', function() Snacks.picker.files() end, mopts)

vim.keymap.set('n', '\\g', function() Snacks.picker.git_log_file() end, mopts)
vim.keymap.set('n', '\\G', function() Snacks.picker.git_log() end, mopts)
vim.keymap.set('n', '\\B', function() Snacks.picker.git_branches() end, mopts)
vim.keymap.set('n', '\\<leader>G', function() Snacks.picker.git_diff() end, mopts)
vim.keymap.set('n', '\\<Tab>', function() Snacks.picker.pick({
    multi = { 'git_files_changed', 'git_files_untracked' },
    matcher = {
        cwd_bonus = true,
        frecency = true,
        sort_empty = true,
    },
}) end, mopts)
vim.keymap.set('n', '\\<S-Tab>', function() Snacks.picker.git_diff({ source = 'git_diff_changed' }) end, mopts)

vim.keymap.set('n', '\\b', function() Snacks.picker.grep_buffers() end, mopts)
vim.keymap.set('n', '\\/', function() Snacks.picker.grep({ dirs = { '.' } }) end, mopts)
vim.keymap.set('n', '\\*', function()
    if Snacks.git.get_root() then
        Snacks.picker.git_grep({
            finder = 'grep',
            regex = false,
            args = { '--word-regexp' },
            format = 'file',
            search = function(picker)
                return picker:word()
            end,
            live = false,
            supports_live = true,
        })
    else
        Snacks.picker.grep_word()
    end
end, mopts)
vim.keymap.set('n', '\\m', function() Snacks.picker.marks() end, mopts)
vim.keymap.set('n', '\\q', function() Snacks.picker.qflist() end, mopts)
vim.keymap.set('n', '\\l', function() Snacks.picker.loclist() end, mopts)
vim.keymap.set('n', '\\c', function() Snacks.picker.lsp_symbols({ filter = { default = { 'Class', 'Interface', 'Struct', 'Trait' } } }) end, mopts)
vim.keymap.set('n', '\\f', function() Snacks.picker.lsp_symbols({ filter = { default = { 'Constructor', 'Function', 'Method' } } }) end, mopts)
vim.keymap.set('n', '\\v', function() Snacks.picker.lsp_symbols({ filter = { default = { 'Enum', 'Field', 'Property', 'Variable', 'Constant' } } }) end, mopts)

vim.keymap.set('n', '=z', function() Snacks.picker.spelling() end, mopts)
vim.keymap.set('n', '<leader>gb', function() Snacks.gitbrowse() end, mopts)
vim.keymap.set('n', '<leader><Enter>', function() Snacks.scratch() end, mopts)
vim.keymap.set({ 'n', 't' }, '<C-\\>', function() Snacks.terminal.focus() end, mopts)
vim.keymap.set('t', '<M-f>', function()
    vim.fn.chansend(vim.o.channel, ' cd ' .. vim.fn.expand('#:p:h') .. '\n')
end, mopts)
