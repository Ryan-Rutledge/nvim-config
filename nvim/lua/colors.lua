require('tokyonight').setup({
    style = 'night',
    styles = {
        comments = { fg = '#F0318D', italic = false },
        functions = { italic = false },
        keywords = { italic = false },
        sidebars = 'dark'
    },
    sidebars = { 'qf', 'help', 'fugitive', 'NvimTree', 'tagbar', 'Outline', 'termtoggle' },
    lualine_bold = true,
    on_colors = function(colors)
    end,
    on_highlights = function(highlights, colors)
        highlights.CursorLineNr = { fg = colors.magenta, bg = colors.bg_highlight }
        highlights.IncSearch = { fg = '#000000', bg = colors.magenta }
    end,
})

vim.cmd[[colorscheme tokyonight]]

-- YELLOW: #FFCB6B
-- PINK:   #F0318D

