return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufNewFile', 'BufReadPost' },
    opts = {
        ensure_installed = { 'javascript', 'typescript', 'python', 'rust', 'c', 'lua', 'vim', 'vimdoc', 'query' },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    }
}
