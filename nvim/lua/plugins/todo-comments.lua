local todo = require('todo-comments')
require('todo-comments').setup({
    keywords = {
        TODO = {icon = ''},
        FIX  = {icon = ''},
        HACK = {icon = '󰈸'},
        WARN = {icon = ''},
        PERF = {icon = '󰅒'},
        NOTE = {icon = '󰆈'},
        TEST = {icon = '󱎫'},
    }
})

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '\\t', '<cmd>TodoTelescope<CR>', mopts)
vim.keymap.set('n', ']t', todo.jump_next, mopts)
vim.keymap.set('n', '[t', todo.jump_prev, mopts)
