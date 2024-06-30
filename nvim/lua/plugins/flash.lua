local flash = require('flash')

flash.setup({
        label = { uppercase = false },
        highlight = {
            backdrop = false,
            groups = { label = 'BufferAlternateTarget' },
            matches = false,
        },
        modes = {
            char = { enabled = false, highlight = { backdrop = false }},
            search = {
                enabled = false,
                jump = { nohlsearch = false },
            },
            treesitter = {
                label = { style = 'overlay' },
            }
        },
    }
)

local mopts = { silent = true, noremap = true }
vim.keymap.set({ 'n', 'v' }, '<A-/>', flash.jump, mopts)
vim.keymap.set({ 'x', 'o' }, '<A-S-/>', flash.treesitter, mopts)
