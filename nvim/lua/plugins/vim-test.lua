local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>')
vim.keymap.set('n', '<leader>tc', ':TestClass<CR>')
vim.keymap.set('n', '<leader>tf', ':TestFile<CR>')
vim.keymap.set('n', '<leader>tl', ':TestLast<CR>')
vim.keymap.set('n', '<leader>to', ':TestVisit<CR>')
