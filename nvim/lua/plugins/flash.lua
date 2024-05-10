return {
    "folke/flash.nvim",
    opts = {
        label = { uppercase = false },
        highlight = {
            backdrop = false,
            groups = { label = 'BufferAlternateTarget' },
            matches = false,
        },
        modes = {
            char = { enabled = false },
            search = {
                enabled = false,
                jump = { nohlsearch = false },
            },
            treesitter = {
                label = { style = 'overlay' },
            }
        },
    },
    keys = {
        { "<leader>/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "<leader>/", mode = { "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
}
