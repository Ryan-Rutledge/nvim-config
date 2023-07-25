vim.g.mapleader = ' '

vim.keymap.set('n', 'U', '<C-r>', { noremap = true })
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
vim.keymap.set('n', '<leader>?', ':nohlsearch<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>L', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cd', ':lcd %:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>%', ':call setreg("+", expand("%:p:h"))<CR>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':helpclose<CR>', { noremap = true, silent = true })

-- movement
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b' , ':bp|bd #<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>`' , ':b #<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n' , ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p' , ':bp<CR>', { noremap = true, silent = true })


-- paste
vim.keymap.set('x', '<leader>p', '"_dp', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>P', '"_dP', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>s', '"_ds', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>S', '"_dS', { noremap = true, silent = true })

-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd({'TermOpen'}, {
    callback = function(_)
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.modifiable = true
    end
})

