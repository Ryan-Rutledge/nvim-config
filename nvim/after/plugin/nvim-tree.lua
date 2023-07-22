vim.opt.termguicolors = true

local nvimtree = require("nvim-tree")

nvimtree.setup({
    disable_netrw = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = { update_root = true },
    view = {
        side = 'right',
    },
    actions ={
        open_file = {
            quit_on_open = true,
        }
    },
})


vim.keymap.set('n', '<leader>f', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
