return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- event = { 'BufNewFile', 'BufReadPost' },
    lazy = false,
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'javascript', 'typescript', 'python', 'rust', 'c', 'lua', 'vim', 'vimdoc', 'query' },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
