return {
    'nvim-lualine/lualine.nvim',
    priority = 999,
    lazy = false,
    config = function()
        local lualine = require('lualine')
        local refresh = function(_) lualine.refresh({ place = { 'statusline' } }) end
        vim.api.nvim_create_autocmd({'RecordingEnter'}, { callback = refresh })
        vim.api.nvim_create_autocmd({'RecordingLeave'}, { callback = refresh })

        lualine.setup({
            options = {
                theme = 'tokyonight',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                winbar = {'netrw', 'Outline', 'fugitive', 'undotree'},
                tabline = {'netrw', 'Outline', 'term'},
                },
                ignore_focus = {'netrw'},
                globalstatus = true,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {
                    'selectioncount',
                    'searchcount',
                    function ()
                        local register = vim.fn.reg_recording()
                        return register == '' and '' or ('@' .. register)
                    end,
                },
                lualine_c = {
                    'location',
                    -- function()
                    --     return ts.statusline({
                    --         type_patterns={'class', 'method', 'function' },
                    --         separator='  ',
                    --         transform_fn = function(line, node)
                    --             return line:gsub('%s*[%[%(%{:].*$', '')
                    --         end,
                    --     })
                    -- end,
                },
                lualine_x = {'%b U+%B'},
                lualine_y = {'branch'},
                lualine_z = {
                    'encoding',
                    'fileformat',
                    '%Y',
                },
            },

            -- inactive_sections = {
            --   lualine_a = {},
            --   lualine_b = {},
            --   lualine_c = {},
            --   lualine_x = {},
            --   lualine_y = {},
            --   lualine_z = {}
            -- },

            tabline = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {{
                    'tabs',
                    mode = 0,
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                }},
            },

            winbar = {
                lualine_a = {
                    '%{expand("%:~:h:t")}',
                    'filename',
                },
                lualine_b = {
                    '%{expand("%:~:h:h")}',
                },
                lualine_c = {},
                lualine_x = {{
                    'diagnostics',
                    symbols = { error = '󰏃 ', warn = '󰔶 ', info = '󰌵 ', hint = ' ' },
                }},
                lualine_y = {},
                lualine_z = {},
            },

            inactive_winbar = {
                lualine_a = {
                    '%{expand("%:~:h:t")}',
                    'filename'
                },
                lualine_b = {
                    '%{expand("%:~:h:h")}',
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },

        })
    end
}
