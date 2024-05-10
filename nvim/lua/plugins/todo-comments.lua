return {
    'folke/todo-comments.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {'\\t', '<cmd>TodoTelescope<CR>', desc='Open todo comments in telescope' },
        {']t', function() require('todo-comments').jump_next() end, silent = true, noremap = true, desc = 'Next todo comment' },
        {'[t', function() require('todo-comments').jump_prev() end, silent = true, noremap = true, desc = 'Previous todo comment' },
    },
    opts = {
        signs = false,
        highlight = {
            multiline = false,
            after = '',
        }
    },
}
