local dap, dapui = require('dap'), require('dapui')

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

require('dap-python').setup()
dapui.setup()

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', '\\c', function() builtin.lsp_document_symbols({symbols = 'class'}) end, mopts)
vim.keymap.set('n', '<F5>', dap.continue, mopts)
vim.keymap.set('n', '<leader>D', dap.continue, mopts)
vim.keymap.set('n', '<leader>dr', dap.restart, mopts)
vim.keymap.set('n', '<leader>dt', dap.terminate, mopts)
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
vim.keymap.set({ 'n', 'v' }, '<leader>K', dapui.eval, mopts)

vim.fn.sign_define('DapBreakpoint',          { text = '', texthl = 'DapUIStop', linehl = '', numhl = ''})
vim.fn.sign_define('DapLogPoint',            { text = '', texthl = 'DapUIStop', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapUIStop', linehl = '', numhl = ''})
vim.fn.sign_define('DapBreakpointRejected',  { text = '', texthl = 'DapUIUnavailable', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',             { text = '󰅂', texthl = 'DapUIBreakpointsCurrentLine', linehl = '', numhl = ''})
