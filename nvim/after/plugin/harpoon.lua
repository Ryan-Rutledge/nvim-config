local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local term = require('harpoon.term')

vim.keymap.set('n', '<leader>m', mark.add_file, { silent = true })
vim.keymap.set('n', '<leader>M', ui.toggle_quick_menu, { silent = true })

vim.keymap.set('n', '<leader>N', function() ui.nav_next() end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>P', function() ui.nav_prev() end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>6', function() ui.nav_file(6) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>7', function() ui.nav_file(7) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>8', function() ui.nav_file(8) end, { silent = true, noremap = true })
vim.keymap.set('n', '<leader>9', function() ui.nav_file(9) end, { silent = true, noremap = true })

vim.keymap.set('n', '<leader>\\', function() term.gotoTerminal(0) end, { silent = true, noremap = true })
vim.keymap.set('n', '<A-t>',
    function()
        term.sendCommand(0, 'cd ' .. vim.fn.expand('%:p:h') .. '\n')
        term.gotoTerminal(0)
    end,
    { silent = true, noremap = true }
)
