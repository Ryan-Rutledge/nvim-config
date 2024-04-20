vim.opt.termguicolors = true

local nvimtree = require('nvim-tree')

nvimtree.setup({
    disable_netrw = true,
    respect_buf_cwd = true,
    hijack_unnamed_buffer_when_opening = true,
    hijack_cursor = true,
    sync_root_with_cwd= true,
    view = {
        signcolumn = 'auto',
        float = { enable = true, },
        width = {}
    },
    renderer = {
        root_folder_label = ':~:s?$?/',
        highlight_git = true,
        icons = {
            git_placement = 'signcolumn',
            modified_placement = 'signcolumn',
            symlink_arrow = ' 󰛂 ',
            glyphs = {
                git = {
                    unstaged = '󰏫',
                    staged = '',
                    unmerged = '',
                    renamed = '',
                    untracked = '󰓎',
                    deleted = '',
                    ignored = '',
                },
            }
        }
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
    git = {
        enable = true,
        show_on_open_dirs = false
    }
})


vim.keymap.set('n', '<leader>F', ':NvimTreeFindFileToggle!<CR>', { silent = true, noremap = true })
