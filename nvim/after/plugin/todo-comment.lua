local todo = require('todo-comments')

todo.setup({
    signs = false,
    highlight = {
        multiline = false,
        after = '',
    }
})

vim.keymap.set('n', '\\t', ':TodoTelescope<CR>', { silent = true, noremap = true, desc = 'Open todo comments in telescope' })
vim.keymap.set('n', ']t', todo.jump_next, { silent = true, noremap = true, desc = 'Next todo comment' })
vim.keymap.set('n', '[t', todo.jump_prev, { silent = true, noremap = true, desc = 'Previous todo comment' })
