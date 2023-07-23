vim.g.terminal_edit = 'edit'
vim.g.floaterm_rootmarkers = '[]'
vim.g.floaterm_keymap_next = '<A-t>'
vim.g.floaterm_keymap_prev = '<A-T>'


vim.keymap.set({'n'}, '<F12>', ':FloatermToggle<CR>', { silent = true, noremap = true })
vim.keymap.set({'t'}, '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true, noremap = true })

