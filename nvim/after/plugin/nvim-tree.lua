vim.opt.termguicolors = true

local nvimtree = require("nvim-tree")

nvimtree.setup({
    disable_netrw = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
    view = {
        side = 'right',
    },
    actions = {
        open_file = {
            quit_on_open = true,

            resize_window = true,
            window_picker = {
                enable = true,
                exclude = {
                    filetype = { 'notify', 'plug', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                    buftype = { 'nofile', 'terminal', 'help' },
                },
            },
        },
        change_dir = {
            enable = true,
            global = true
        }
    },
})


vim.keymap.set('n', '<leader>f', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
