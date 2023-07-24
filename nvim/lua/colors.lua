require('tokyonight').setup({
    styles = {
        comments = { fg = '#F0318D', italic = false },
        functions = { italic = false },
        keywords = { italic = false },
        sidebars = 'dark'
    },
    sidebars = { 'qf', 'help', 'fugitive', 'NvimTree', 'tagbar' },
    on_colors = function(colors)
        colors.bg = '#10111a'
        colors.bg_highlight = '#090a15'
        colors.bg_sidebar = '#07000a'
    end,
    on_highlights = function(highlights, colors)
        highlights.CursorLineNr = { fg = colors.magenta, bg = colors.bg_highlight }
        highlights.CursorLineSign = { bg = colors.bg_highlight }
        highlights.Visual = {bg = '#554670'}
    end,
    lualine_bold = true,
})

vim.cmd[[colorscheme tokyonight]]

-- YELLOW: #FFCB6B
-- PINK:   #F0318D

