local flash = require('flash')

flash.setup({
        label = { uppercase = false },
        modes = {
            char = {
                enabled = true,
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
    }
)

local mopts = { silent = true, noremap = true }
vim.keymap.set({ 'n', 'v' }, '?', flash.jump, mopts)
