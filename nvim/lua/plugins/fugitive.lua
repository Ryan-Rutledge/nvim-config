local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>G', vim.cmd.Git, mopts)
vim.keymap.set('n', '<leader>gm', ':silent Gvdiffsplit!<CR>', mopts)
vim.keymap.set('n', '<leader>gk', '[c', { silent = true, remap = true }, mopts)
vim.keymap.set('n', '<leader>gj', ']c', { silent = true, remap = true }, mopts)
vim.keymap.set('n', '<leader>gl', ':silent diffget //2<CR>', { silent = true, remap = false }, mopts)
vim.keymap.set('n', '<leader>gh', ':silent diffget //3<CR>', { silent = true, remap = false }, mopts)
