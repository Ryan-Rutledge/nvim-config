
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
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      winbar = {'NvimTree', 'tagbar', 'Outline', 'fugitive', 'toggleterm', '', },
      tabline = {'NvimTree', 'tagbar', 'Outline'},
    },
    ignore_focus = {'NvimTree', 'tagbar'},
    globalstatus = true,
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'selectioncount', current_macro },
    lualine_c = {'searchcount'},
    lualine_x = {'%b U+%B'},
    lualine_y = {'location', '%L'},
    lualine_z = {'%n'},
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
    lualine_a = {
        'branch'
    },
    lualine_b = {
        {
            'filename',
            path = 3,
            fmt = fancySlash,
            file_status = false,
            use_mode_colors = false,
        },
    },
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
        {
            'filename',
            path = 4,
            fmt = fancySlash,
            file_status = false
        },
    },
    lualine_b = { '%R%M', },
    lualine_c = {
        {
        'diagnostics',
        symbols = { error = '󰏃 ', warn = '󰔶 ', info = '󰅺 ', hint = ' ' },
    }},
    lualine_x = {'encoding', 'fileformat', },
    lualine_y = { 'filesize', },
    lualine_z = {
        {
            'filetype',
            colored = false,
            icon = { align = 'right'},
        }
    },
  },

  inactive_winbar = {
    lualine_a = {
        {
            'filename',
            path = 4,
            fmt = fancySlash,
            file_status = false
        },
    },
    lualine_b = { '%R%M', },
    lualine_c = {},
    lualine_x = {'fileformat', 'encoding' },
    lualine_y = {'filesize'},
    lualine_z = {
        {
            'filetype',
            colored = false,
            icon = {align = 'right'},
        },
    },
  },
}

