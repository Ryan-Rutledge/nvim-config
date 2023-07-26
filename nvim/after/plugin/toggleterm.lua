require('toggleterm').setup({
    open_mapping = [[<c-\>]],
    direction = 'float',
    highlights = {
        FloatBorder = {
          guifg = '#F0318D',
        }
    },
    float_opts = {
        border ='curved'
    },
    autochdir = true,
    shade_terminals = false,
})
