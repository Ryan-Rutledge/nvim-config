return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = "VeryLazy",
    config = function()
        require('nvim-treesitter.configs').setup({
            textobjects = {
                swap = {
                    enable = true,
                    swap_next = {
                        ["<A-l>"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<A-h>"] = "@parameter.inner",
                    },
                },
                select = {
                    enable = true,
                    lookahead = true,
                    include_surrounding_whitespace = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },

                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["<C-j>"] = "@function.inner",
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                        ["]/"] = "@comment",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["<C-k>"] = "@function.inner",
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                        ["[/"] = "@comment",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
        })
    end
}
