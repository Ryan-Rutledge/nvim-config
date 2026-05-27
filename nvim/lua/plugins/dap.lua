local dap = require('dap')

require('dap-python').setup()

dap.adapters.gdb = {
    type = 'executable',
    command = 'gdb',
    args = { '--quiet', '--interpreter=dap' },
}

dap.configurations.c = {
    {
        name = 'Run Executable (GDB)',
        type = 'gdb',
        request = 'launch',
        program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
    }
}

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>D', function() vim.cmd('DapViewToggle') end, mopts)
vim.keymap.set('n', '<F5>', function() dap.continue() vim.cmd('DapViewOpen') end, mopts)
vim.keymap.set('n', '<leader>dr', dap.restart, mopts)
vim.keymap.set('n', '<leader>dt', function() dap.terminate() vim.cmd('DapViewClose') end, mopts)
vim.keymap.set('n', '<leader>d<BS>', dap.clear_breakpoints, mopts)
vim.keymap.set('n', '<leader>d<Enter>', dap.run_to_cursor, mopts)
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, mopts)
vim.keymap.set('n', '<leader>dd', dap.toggle_breakpoint, mopts)
vim.keymap.set('n', '<leader>dc', function() local con = vim.fn.input('Log Condition: ') dap.set_breakpoint(con, nil, 'LOG_POINT_CONDITION: ' .. con) end, mopts)
vim.keymap.set('n', '<leader>dC', function() local con = vim.fn.input('Break Condition: ') dap.set_breakpoint(con) end, mopts)
vim.keymap.set('n', '<leader>dl', function() dap.set_breakpoint(nil, nil, 'LOG_POINT') end, mopts)
vim.keymap.set('n', '<leader>dL', function() dap.set_breakpoint(nil, nil, 'LOG_POINT: ' .. vim.fn.input('Log message: ')) end, mopts)
vim.keymap.set('n', '<F10>', dap.step_over, mopts)
vim.keymap.set('n', '<leader>do', dap.step_over, mopts)
vim.keymap.set('n', '<leader>N', dap.step_over, mopts)
vim.keymap.set('n', '<F11>', dap.step_into, mopts)
vim.keymap.set('n', '<leader>di', dap.step_into, mopts)
vim.keymap.set('n', '<leader>n', dap.step_into, mopts)
vim.keymap.set('n', '<leader>dO', dap.step_out, mopts)

vim.fn.sign_define('DapBreakpoint',          { text = '', texthl = 'MiniIconsRed', linehl = '', numhl = ''})
vim.fn.sign_define('DapLogPoint',            { text = '', texthl = 'MiniIconsRed', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'MiniIconsRed', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected',  { text = '', texthl = 'MiniIconsRed', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',             { text = '󰅂', texthl = 'MiniIconsBlue', linehl = '', numhl = ''})


