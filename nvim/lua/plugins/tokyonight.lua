require('tokyonight').setup({
    style = 'night',
    styles = {
        functions = { italic = false },
        keywords = { italic = false },
        sidebars = 'dark'
    },
    sidebars = { 'qf', 'help', 'fugitive', 'netrw', 'Outline', 'Telescope',},
    on_colors = function(colors)
        colors.comment = '#eeeeee'
    end,
    on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.dark5 }
        highlights.DiagnosticUnnecessary = { fg = colors.dark5 }
        highlights.YankFlash = { fg = colors.black, bg = colors.blue }

        highlights.StatusLineNC = { fg = colors.dark5, bg = colors.bg_statusline}
        highlights.StatusLineFlags = { fg = colors.orange, bg = colors.bg_statusline}
        highlights.StatusLineFlagsNC = { fg = colors.black, bg = colors.bg_statusline}
        highlights.StatusLineFilePath = { fg = colors.dark5, bg = colors.bg_statusline}
        highlights.StatusLineShowCmd = { fg = colors.purple, bg = colors.bg_statusline}
        highlights.StatusLineRecording = { fg = colors.red, bg = colors.bg_statusline}
        highlights.StatusLinePosition = { fg = colors.blue, bg = colors.bg_statusline}
        highlights.StatusLineCharCode = { fg = colors.cyan, bg = colors.bg_statusline}
        highlights.StatusLineFileMeta = { fg = colors.green, bg = colors.bg_statusline}
    end,
})

-- flash yanked text
vim.api.nvim_create_autocmd({'TextYankPost'}, {
    callback = function(_) vim.highlight.on_yank({higroup='YankFlash', timeout=200}) end
})
