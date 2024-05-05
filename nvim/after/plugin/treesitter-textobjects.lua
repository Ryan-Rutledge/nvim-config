require('nvim-treesitter.configs').setup {
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>s"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>S"] = "@parameter.inner",
            },
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
            -- include_surrounding_whitespace = true,
        },

        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["<C-j>"] = "@function.inner",
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["<C-k>"] = "@function.inner",
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },
}
