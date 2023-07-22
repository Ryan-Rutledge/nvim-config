vim.g.mapleader = ' '

vim.keymap.set('n', 'U', '<C-r>', { noremap = true })
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('n', '<A-t>', ':lcd %:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cd', ':lcd %:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>?', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>L', ':set relativenumber!<CR>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set({ 't' }, '<A-t>', 'cd expand("#:p:h")<CR>', { noremap = true, silent = true })

-- paste
vim.keymap.set('x', '<leader>p', '"_dp', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>P', '"_dP', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>s', '"_ds', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>S', '"_dS', { noremap = true, silent = true })

-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd({"TermOpen"}, {
    callback = function(_)
        vim.opt.number = true
        vim.opt.modifiable = true
    end
})
