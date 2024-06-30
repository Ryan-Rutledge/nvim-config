require('tokyonight').setup({
    style = 'night',
    styles = {
        functions = { italic = false },
        keywords = { italic = false },
        sidebars = 'dark'
    },
    sidebars = { 'qf', 'help', 'fugitive', 'netrw', 'Outline', 'Telescope',},
    on_highlights = function(highlights, colors)
        highlights.Comment = { fg = '#EEEEEE' }
        highlights.LineNr = { fg = colors.dark5 }
        highlights.DiagnosticUnnecessary = { fg = colors.dark5 }
        highlights.YankFlash = { fg = colors.black, bg = colors.blue }

        highlights.StatusLine = { fg = '#c0caf5', bg = colors.black}
        highlights.StatusLineNC = { fg = '#4c5372', bg = colors.black}
        highlights.StatusLineFlags = { fg = '#e0af68', bg = colors.black}
        highlights.StatusLineFileName = { fg = '#9d7cd8', bg = colors.black}
        highlights.StatusLineShowCmd = { fg = '#ff9e64', bg = colors.black}
        highlights.StatusLineRecording = { fg = '#f7768e', bg = colors.black}
        highlights.StatusLinePosition = { fg = '#7aa2f7', bg = colors.black}
        highlights.StatusLineCharCode = { fg = '#7dcfff', bg = colors.black}
        highlights.StatusLineFileMeta = { fg = '#93ce68', bg = colors.black}
    end,
})

-- flash yanked text
vim.api.nvim_create_autocmd({'TextYankPost'}, {
    callback = function(_) vim.highlight.on_yank({higroup='YankFlash', timeout=200}) end
})
