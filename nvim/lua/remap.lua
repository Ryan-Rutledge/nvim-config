vim.g.mapleader = ' '
local mopts = { silent = true, noremap = true }

vim.keymap.set('n', 'U', '<C-r>', mopts)
vim.keymap.set('n', 'Y', 'y$', mopts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>L', ':set relativenumber!<CR>', mopts)
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>', mopts)
vim.keymap.set('n', '<leader>CD', ':cd ..<CR>', mopts)
vim.keymap.set('n', '<leader>%', ':call setreg("+", expand("%:p:h"))<CR>', mopts)
vim.keymap.set('n', '<leader>q', ':helpclose<CR>', mopts)

-- movement
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', mopts)
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', mopts)
vim.keymap.set('n', '<leader>-' , ':bp|bd #<CR>', mopts)
vim.keymap.set('n', '<leader>`' , ':b #<CR>', mopts)

-- paste
vim.keymap.set('x', '<leader>p', '"_dp', mopts)
vim.keymap.set('x', '<leader>P', '"_dP', mopts)
vim.keymap.set('x', '<leader>s', '"_ds', mopts)
vim.keymap.set('x', '<leader>S', '"_dS', mopts)

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>') 

-- terminal
vim.keymap.set(
    'n', '<C-\\>',
    function()
        if not pcall(function() vim.cmd(':b term://') end) then
            vim.api.nvim_command('terminal')
        end

        vim.cmd('startinsert')
    end,
    mopts
)
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', mopts)
vim.keymap.set('t', '<C-\\>', '<C-\\><C-N>:b #<CR>', mopts)
vim.keymap.set('t', '<M-f>', function()
    vim.fn.chansend(vim.o.channel, ' cd ' .. vim.fn.expand("#:p:h") .. '\n')
end, mopts)
