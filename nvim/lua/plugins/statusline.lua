local function make_tab(tab, active_tab, active_window, active_buffer)
    local bg = tab == active_tab and '%#TabLineSelTab#' or '%#TabLine#'
    local windows = vim.api.nvim_tabpage_list_wins(tab)
    local filenames = {}

    for _, window in ipairs(windows) do
        local buffer = vim.api.nvim_win_get_buf(window)
        local full_path = vim.api.nvim_buf_get_name(buffer)

        if full_path ~= '' then
            local prefix = vim.api.nvim_get_option_value('modified', { buf = buffer }) and '  ' or ' '

            if tab == active_tab then
                if window == active_window and buffer == active_buffer then
                    prefix = '%#TabLineSel#' .. prefix
                end
            elseif buffer == vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab)) then
                prefix = '%#TabLineSelInactive#' .. prefix
            end

            local filename = prefix .. vim.fn.fnamemodify(full_path, ':t') .. ' ' .. bg

            table.insert(filenames, filename)
        end
    end

    return bg .. table.concat(filenames, ' ') .. '%#TabLine#'
end

_G.custom_tabline = function()
    local active_tab = vim.api.nvim_get_current_tabpage()
    local active_window = vim.api.nvim_get_current_win()
    local active_buffer = vim.api.nvim_get_current_buf()

    local tabs = {}
    for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
        table.insert(tabs, make_tab(tab, active_tab, active_window, active_buffer))
    end

    return '%#TabLineFill#%=%#TabLine#' .. table.concat(tabs, ' %#TabLineDivider#│%#TabLine# ') .. '%#TabLineFill#%='
end

vim.opt.tabline = '%!v:lua.custom_tabline()'

vim.g._macro_str = ''
vim.api.nvim_create_autocmd('RecordingEnter', { callback = function() vim.g._macro_str = '@' .. vim.fn.reg_recording() end })
vim.api.nvim_create_autocmd('RecordingLeave', { callback = function() vim.g._macro_str = '' end })
vim.api.nvim_create_autocmd('FileType', { pattern = 'help', callback = function() vim.opt_local.statusline = '%t%#StatusLineDither#%{(v:hlsearch?_search_progress():" ")}%=%y' end })
function vim.g._search_progress() if vim.fn.searchcount().current > 0 then return string.format(' [%d/%d] ', vim.fn.searchcount().current, vim.fn.searchcount().total) else return '' end end
vim.opt.statusline = '%#StatusLineFlags#%m%w%q%h%*%{fnamemodify(expand("%"), ":.")} %#StatusLineDither#%{(v:hlsearch?_search_progress():" ")}%#StatusLineRecording#%{g:_macro_str}%#StatusLineShowCmd#%S%=%7(%#StatusLinePosition#%l,%-3c%) %10(%#StatusLineCharCode#%b U+%04B%) %#StatusLineFileMeta#%{&fileencoding}%{(&bomb?"BOM":"")} %{&fileformat}%* %Y'
