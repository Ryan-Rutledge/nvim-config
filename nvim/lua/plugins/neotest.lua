local neotest = require('neotest')
neotest.setup({
    adapters = {
        require('neotest-python')({
            dap = { justMyCode = false },
        }),
    },
})

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>tt', neotest.run.run, mopts)
vim.keymap.set('n', '<leader>td', function() neotest.run.run({ strategy = 'dap' }) end, mopts)
vim.keymap.set('n', '<leader>tw', function() neotest.watch.toggle(vim.fn.expand('%')) end, mopts)
vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end, mopts)
