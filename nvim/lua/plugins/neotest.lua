local neotest = require('neotest')

neotest.setup({
    adapters = {
        require('neotest-python')({
            dap = { justMyCode = false },
        }),
        require('rustaceanvim.neotest')
    }
})

local mopts = { silent = true, noremap = true }

-- Test nearest
vim.keymap.set('n', '<leader>tt', function()
    neotest.output_panel.clear()
    neotest.run.run()
    neotest.output.open()
end, mopts)

-- Test file
vim.keymap.set('n', '<leader>tf', function()
    neotest.output_panel.clear()
    neotest.run.run(vim.fn.expand('%'))
    neotest.output_panel.open()
end, mopts)

vim.keymap.set('n', '<leader>ta', neotest.run.attach, mopts)
vim.keymap.set('n', '<leader>to', neotest.output.open, mopts)
vim.keymap.set('n', '<leader>tw', function() neotest.watch.toggle(vim.fn.expand('%')) end, mopts)
vim.keymap.set('n', '<leader>td', function()
    neotest.run.run({ strategy = 'dap' })
    vim.cmd('DapViewOpen')
end)
