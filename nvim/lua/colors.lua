require('tokyonight').setup({
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

        local cmd_bg = colors.bg_dark
        highlights.NoiceCmdLinePopupTitle = { fg = cmd_bg, bg = cmd_bg }
        highlights.NoiceCmdlinePopupBorder = { bg = cmd_bg, fg = cmd_bg }
        highlights.NoiceCmdlinePopupBorderSearch = { bg = cmd_bg, fg = cmd_bg }
        highlights.NoiceCmdlinePopup = { bg = cmd_bg }
        highlights.NoiceCmdlinePropt = { fg = colors.magenta2 }

        highlights.CursorLineNr = { fg = colors.dark5 }
        highlights.CursorLineNr = { fg = colors.magenta, bg = colors.bg_highlight }
        highlights.IncSearch = { fg = '#000000', bg = colors.magenta }
        highlights.DiagnosticUnnecessary = { fg = colors.dark5 }
    end,
})

vim.cmd[[colorscheme tokyonight]]


