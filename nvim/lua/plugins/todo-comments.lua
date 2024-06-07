return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    event = 'VeryLazy',
    cmd = 'TodoTelescope',
    keys = {
        {'\\t', '<cmd>TodoTelescope<CR>', desc='Open todo comments in telescope' },
        {']t', function() require('todo-comments').jump_next() end, silent = true, noremap = true, desc = 'Next todo comment'},
        {'[t', function() require('todo-comments').jump_prev() end, silent = true, noremap = true, desc = 'Previous todo comment'},
    },
    opts = {
        keywords = {
            TODO = {icon = ''},
            FIX  = {icon = ''},
            HACK = {icon = '󰈸'},
            WARN = {icon = ''},
            PERF = {icon = '󰅒'},
            NOTE = {icon = '󰆈'},
            TEST = {icon = '󱎫'},
        }
    },
}
