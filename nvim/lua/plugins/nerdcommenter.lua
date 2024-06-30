vim.g.NERDCreateCustomMappings = 0
vim.g.NERDSpaceDelims = 1
vim.g.NERDCommentEmptyLines = 1
vim.g.NERDToggleCheckAllLines = 1
vim.g.NERDDefaultAlign = 'left'

local mopts = { silent = true, noremap = true }
vim.keymap.set({ 'n', 'v' }, '<C-/>', ':call nerdcommenter#Comment(1, "toggle")<CR>')
vim.keymap.set({ 'n', 'v' }, '<C-_>', ':call nerdcommenter#Comment(1, "toggle")<CR>')
