return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
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
    },
    keys = {
        { '<A-/>', mode = { 'n', 'v' }, function() require('flash').jump() end, desc = 'Flash' },
        { '<A-/>', mode = { 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    },
}
