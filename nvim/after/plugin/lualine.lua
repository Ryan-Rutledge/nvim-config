
local simpleFilename = function(filename)
    local extension_index, _ = string.find(filename, '%.', 2)
    if extension_index == nil then
        return filename
    else
        return string.sub(filename, 0, extension_index-1)
    end
end

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    -- SYMBOL REFERENCE: - 
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {'NvimTree', 'tagbar'},
      tabline = {'NvimTree', 'tagbar'},
    },
    ignore_focus = {'NvimTree', 'tagbar'},
    globalstatus = true,
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'selectioncount'},
    lualine_c = {'searchcount'},
    lualine_x = {'%b U+%B'},
    lualine_y = {'location'},
    lualine_z = {'progress', '%L'},
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'%L'},
    lualine_z = {'location'}
  },

  tabline = {
    lualine_a = {'branch'},
    lualine_b = {{
        'filename',
        path = 3,
        file_status = false
    }},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {{
        'tabs',
        mode = 1,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        fmt = simpleFilename,
    }},
  },

  winbar = {
    lualine_a = {{
        'filename',
        path = 0,
        file_status = false,
    }},
    lualine_b = {'%R%H%W%M'},
    lualine_c = {{
        'diagnostics',
        symbols = { error = '󰏃 ', warn = '󰔶 ', info = '󰅺 ', hint = ' ' },
    }},
    lualine_x = {
    },
    lualine_y = {'filesize', 'fileformat', 'encoding', },
    lualine_z = {{
        'filetype',
        colored = false,
        icon = { align = 'right'},
    }},
  },

  inactive_winbar = {
    lualine_a = {{'filename', path = 0, file_status = false }},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  extensions = { 'nvim-tree', 'fugitive' }
}
