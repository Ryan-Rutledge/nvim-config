vim.g.mapleader = ' '

vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })
vim.keymap.set('n', 'Y', 'y$', { noremap = true, silent = true })
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>L', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>cd', ':lcd %:p:h<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>%', ':call setreg("+", expand("%:p:h"))<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':helpclose<CR>', { noremap = true, silent = true })

-- movement
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b' , ':bp|bd #<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>`' , ':b #<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>' , ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>' , ':bn<CR>', { noremap = true, silent = true })

-- paste
vim.keymap.set('x', '<leader>p', '"_dp', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>P', '"_dP', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>s', '"_ds', { noremap = true, silent = true })
vim.keymap.set('x', '<leader>S', '"_dS', { noremap = true, silent = true })


-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true, silent = true })

