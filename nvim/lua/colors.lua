local tokyonight = require('tokyonight')
local util = require('tokyonight.util')

tokyonight.setup({
    style = 'night',
    styles = {
        functions = { italic = false },
        keywords = { italic = false },
        sidebars = 'dark'
    },
    sidebars = { 'qf', 'help', 'fugitive', 'NvimTree', 'tagbar', 'Outline', 'Telescope', 'toggleterm' },
    lualine_bold = true,
    on_highlights = function(highlights, colors)
        highlights.Comment = { fg = '#FFFFFF', italic = false }

        -- local tele_bg = colors.bg
        -- local input_bg = colors.bg_dark
        -- highlights.TelescopeMultiSelection = { fg = colors.magenta }
        -- highlights.TelescopeNormal = { bg = tele_bg }
        -- highlights.TelescopeSelection = { link = 'CursorLine' }
        -- highlights.TelescopeMatching = { link = 'Search' }
        -- highlights.TelescopeBorder = { fg = tele_bg, bg = tele_bg}
        -- highlights.TelescopePromptBorder = { fg = input_bg, bg = input_bg }
        -- highlights.TelescopePromptNormal = { bg = input_bg }
        -- highlights.TelescopeTitle = { fg = colors.bg_dark, bg = colors.purple }


        highlights.Visual = { bg = util.blend(colors.yellow, colors.black, 0.25) }
        highlights.CursorLineNr = { fg = colors.dark5 }
        highlights.CursorLineNr = { fg = colors.magenta, bg = colors.bg_highlight }
        highlights.IncSearch = { fg = '#000000', bg = colors.magenta }
        highlights.DiagnosticUnnecessary = { fg = colors.dark5 }
    end,
})

vim.cmd[[colorscheme tokyonight]]


