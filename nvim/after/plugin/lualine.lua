local lualine = require('lualine')
local refresh = function(_) lualine.refresh({ place = { 'statusline' } }) end
vim.api.nvim_create_autocmd({'RecordingEnter'}, { callback = refresh })
vim.api.nvim_create_autocmd({'RecordingLeave'}, { callback = refresh })
local function window() return vim.api.nvim_win_get_number(0) end
local function current_macro()
    local register = vim.fn.reg_recording()
    return register == '' and '' or ('@' .. register)
end

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
    lualine_b = {current_macro, 'selectioncount', 'searchcount'},
    lualine_c = {},
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
        'windows',
        show_modified_status = false,
        fmt = function(f) return f:gsub('%..+', '') end,
        mode = 2,
    }},
    lualine_b = {},
    lualine_c = {
    },
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
        window,
    },
    lualine_b = {
        '%m%w%r%h'
    },
    lualine_c = {{
        'diagnostics',
        symbols = { error = '󰏃 ', warn = '󰔶 ', info = '󰌵 ', hint = ' ' },
    }},
    lualine_x = {},
    lualine_y = {
        '%{expand("%:~:h:h")}',
    },
    lualine_z = {
        '%{expand("%:~:h:t")}',
        '%t'
    },
  },

  inactive_winbar = {
    lualine_a = {
        window,
    },
    lualine_b = {
        '%m%w%r%h'
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
        '%{expand("%:~:h:h")}',
    },
    lualine_z = {
        '%{expand("%:~:h:t")}',
        '%t'
    },
  },
}

-- vim.opt.showtabline = 1
