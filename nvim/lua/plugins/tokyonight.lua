return {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        require('tokyonight').setup({
            style = 'night',
            styles = {
                functions = { italic = false },
                keywords = { italic = false },
                sidebars = 'dark'
            },
            sidebars = { 'qf', 'help', 'fugitive', 'netrw', 'Outline', 'Telescope',},
            lualine_bold = true,
            on_highlights = function(highlights, colors)
                highlights.Comment = { fg = '#EEEEEE', italic = false }

                local tele_bg = colors.bg_dark
                highlights.TelescopeBorder = { fg = tele_bg, bg = tele_bg}
                highlights.TelescopePromptBorder = { fg = tele_bg, bg = tele_bg }

                local vis_bg = require('tokyonight.util').blend(colors.purple, colors.black, 0.3)
                highlights.Visual = { bg = vis_bg }
                highlights.CursorLineNr = { fg = colors.dark5 }
                highlights.CursorLineNr = { fg = colors.magenta, bg = colors.bg_highlight }
                highlights.IncSearch = { fg = colors.black, bg = colors.magenta }
                highlights.Search = { fg = colors.black, bg = colors.yellow }
                highlights.DiagnosticUnnecessary = { fg = colors.dark5 }
                highlights.StatusLine = { fg = colors.fg, bg = colors.bg }
            end,
        })

        -- flash yanked text
        vim.api.nvim_create_autocmd({'TextYankPost'}, {
            callback = function(_)
                vim.highlight.on_yank({higroup='YankyYanked', timeout=180})
                end
        })

        vim.cmd[[colorscheme tokyonight]]
    end
}
