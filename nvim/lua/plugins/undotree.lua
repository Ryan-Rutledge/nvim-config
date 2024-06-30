vim.g.undotree_SetFocusWhenToggle = true
vim.g.undotree_ShortIndicators = true

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { silent = true, noremap = true })
