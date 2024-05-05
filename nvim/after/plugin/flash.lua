require('flash').setup({
    label = { uppercase = false },
    highlight = {
        backdrop = false,
        groups = { label = 'BufferAlternateTarget' },
        matches = false,
    },
    modes = {
        char = { enabled = false },
        search = {
            jump = { nohlsearch = false },
        },
        treesitter = {
            label = { style = 'overlay' },
        }
    },
})

local opts = { noremap = true, silent = true }
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>/', require('flash').jump, opts)
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, opts)
vim.keymap.set({ 'x', 'o' }, 's', require('flash').treesitter, opts)
