local flash = require('flash')

flash.setup({
    label = { uppercase = false },
    highlight = {
        groups = { label = 'BufferAlternateTarget' },
    },
    modes = {
        char = {
            enabled = false,
            highlight = { backdrop = false },
            multi_line = false,
            char_actions = function(motion)
                return {
                    [';'] = 'right',
                    [','] = 'left',
                }
            end,
        },
        search = {
            enabled = false,
            jump = { nohlsearch = false },
        },
        treesitter = {
            label = { style = 'overlay' },
        }
    },
})

local mopts = { silent = true, noremap = true }
vim.keymap.set({ 'n', 'v' }, '?', flash.jump, mopts)
