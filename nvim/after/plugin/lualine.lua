local ts = require('nvim-treesitter')
local lualine = require('lualine')
local refresh = function(_) lualine.refresh({ place = { 'statusline' } }) end
vim.api.nvim_create_autocmd({'RecordingEnter'}, { callback = refresh })
vim.api.nvim_create_autocmd({'RecordingLeave'}, { callback = refresh })
local function window() return vim.api.nvim_win_get_number(0) end

lualine.setup {
  options = {
    theme = 'tokyonight',
    -- SYMBOL REFERENCE: - 
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      winbar = {'NvimTree', 'Outline', 'fugitive', 'undotree'},
      tabline = {'NvimTree', 'Outline', 'term'},
    },
    ignore_focus = {'NvimTree'},
    globalstatus = true,
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {
        function ()
            local register = vim.fn.reg_recording()
            return register == '' and '' or ('@' .. register)
        end,
        'selectioncount',
        'searchcount'},
    lualine_c = {
        function()
            return ts.statusline({
                type_patterns={'class', 'method', 'function' },
                separator='  ',
                transform_fn = function(line, node)
                    return line:gsub('%s*[%[%(%{:].*$', '')
                end,
            })
        end,
    },
    lualine_x = {'%b U+%B'},
    lualine_y = {'location'},
    lualine_z = {
        'branch',
        '%Y',
        'encoding',
        'fileformat',
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
    lualine_a = {{
        'tabs',
        mode = 0,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    }},
    lualine_b = {},
    lualine_c = {
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {{
        'windows',
        show_modified_status = false,
        fmt = function(f) return f:gsub('%..+', '') end,
        mode = 2,
    }},
  },

  winbar = {
    lualine_a = {
        '%{expand("%:~:h:t")}',
        '%t'
    },
    lualine_b = {
        '%{expand("%:~:h:h")}',
    },
    lualine_c = {},
    lualine_x = {{
        'diagnostics',
        symbols = { error = '󰏃 ', warn = '󰔶 ', info = '󰌵 ', hint = ' ' },
    }},
    lualine_y = {
        '%m%w%r%h',
    },
    lualine_z = {
        window,
    },
  },

  inactive_winbar = {
    lualine_a = {
        '%{expand("%:~:h:t")}',
        '%t'
    },
    lualine_b = {
        '%{expand("%:~:h:h")}',
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
        '%m%w%r%h'
    },
    lualine_z = {
        window,
    },
  },
}

-- vim.opt.showtabline = 1
