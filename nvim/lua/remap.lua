vim.g.mapleader = ' '
local mopts = { silent = true, noremap = true }

vim.keymap.set('n', 'U', '<C-r>', mopts)
vim.keymap.set('n', 'Y', 'y$', mopts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>L', ':set relativenumber!<CR>', mopts)
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>', mopts)
vim.keymap.set('n', '<leader>CD', ':cd ..<CR>', mopts)
vim.keymap.set('n', '<leader>%', ':call setreg("+", expand("%:p:h"))<CR>', mopts)
vim.keymap.set('n', '<leader>q', ':helpclose<CR>', mopts)

-- movement
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', mopts)
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', mopts)
vim.keymap.set('n', '<leader>b' , ':bp|bd #<CR>', mopts)
vim.keymap.set('n', '<leader>`' , ':b #<CR>', mopts)
vim.keymap.set('n', '<C-k>' , ':bp<CR>', mopts)
vim.keymap.set('n', '<C-j>' , ':bn<CR>', mopts)

-- paste
vim.keymap.set('x', '<leader>p', '"_dp', mopts)
vim.keymap.set('x', '<leader>P', '"_dP', mopts)
vim.keymap.set('x', '<leader>s', '"_ds', mopts)
vim.keymap.set('x', '<leader>S', '"_dS', mopts)

-- fast tab movement
vim.keymap.set('n', '<leader>1', '1gt', mopts)
vim.keymap.set('n', '<leader>2', '2gt', mopts)
vim.keymap.set('n', '<leader>3', '3gt', mopts)
vim.keymap.set('n', '<leader>4', '4gt', mopts)
vim.keymap.set('n', '<C-h>' , 'gT', mopts)
vim.keymap.set('n', '<C-l>' , 'gt', mopts)

-- terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', mopts)

