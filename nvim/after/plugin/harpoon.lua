local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local notify = require('notify')

vim.keymap.set('n', '<C-j>', ui.nav_prev, { silent = true, noremap = true })
vim.keymap.set('n', '<C-k>', ui.nav_next, { silent = true, noremap = true })
vim.keymap.set('n', '<leader><CR>', ui.toggle_quick_menu, { noremap = true, silent = true })

vim.keymap.set(
    'n',
    '<CR>',
    function()
        if (vim.v.count == 0) then
            mark.add_file()
            notify('File marked')
        else
            ui.nav_file(vim.v.count)
        end
    end,
    { noremap = true, silent = true }
)
