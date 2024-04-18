local fancySlash = function(filename)
    return filename:gsub('/', '  ')
end

local function current_macro()
    local register = vim.fn.reg_recording()
    return register == '' and '' or ('@' .. register)
end

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    -- SYMBOL REFERENCE: - 
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      winbar = {'NvimTree', 'Outline', 'fugitive', },
      tabline = {'NvimTree', 'Outline'},
    },
    ignore_focus = {'NvimTree'},
    globalstatus = true,
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {current_macro, 'selectioncount', 'searchcount'},
    lualine_c = {
        {
            'filename',
            path = 3,
            file_status = false,
        }
    },
    lualine_x = {'%b U+%B'},
    lualine_y = {'location'},
    lualine_z = {
        'fileformat',
        'encoding',
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
    lualine_a = {'branch'},
    lualine_b = {{
        'filename',
        path = 4,
        fmt = fancySlash,
    }},
    lualine_c = {{
        'diagnostics',
        symbols = { error = '󰏃 ', warn = '󰔶 ', info = '󰌵 ', hint = ' ' },
    }},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  inactive_winbar = {
    lualine_a = {
        'branch',
        {
            'filename',
            path = 4,
            fmt = fancySlash,
        }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

vim.opt.showtabline = 1
