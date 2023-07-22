vim.g.NERDCreateCustomMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDToggleCheckAllLines = 1
vim.g.NERDDefaultAlign = 'left'

vim.opt.formatoptions:remove({'c', 'r', 'o'})


vim.keymap.set({ 'n', 'v' }, '<C-_>', ':call nerdcommenter#Comment(1, "toggle")<CR>', { silent = true, noremap = true })

