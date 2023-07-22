local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>m', mark.add_file, { silent = true })
vim.keymap.set('n', '<leader>M', ui.toggle_quick_menu, { silent = true })

vim.keymap.set('n', '<leader>j', function() ui.nav_file(1) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>k', function() ui.nav_file(2) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>l', function() ui.nav_file(3) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>;', function() ui.nav_file(4) end, { silent = true, noremap = true })

