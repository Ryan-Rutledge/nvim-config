vim.keymap.set('n', '<leader>G', vim.cmd.Git, { silent = true, noremap = true } )
vim.keymap.set('n', '<leader>gd', ':Git difftool -y %<CR>', { silent = true, noremap = true })

