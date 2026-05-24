local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>G', vim.cmd.Git, mopts)
vim.keymap.set('n', '<leader>gm', ':silent Gvdiffsplit!<CR>', mopts)
vim.keymap.set('n', '<leader>gl', ':silent diffget //2<CR>', mopts)
vim.keymap.set('n', '<leader>gh', ':silent diffget //3<CR>', mopts)
