require('toggleterm').setup({
    open_mapping = [[<c-\>]],
    direction = 'float',
    highlights = {
        FloatBorder = {
          guifg = '#F0318D',
        }
    },
    float_opts = {
        border ='curved',
        winblend = 15,
    },
    autochdir = true,
    shade_terminals = false,
})
