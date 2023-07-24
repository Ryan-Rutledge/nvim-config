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
    lualine_a = {{
        'buffers',
        mode = 4,
        show_filename_only = true,
        hide_filename_extension = true,
        show_modified_status = true,
        icons_enabled = false,
        disabled_buftypes = { 'quickfix', 'prompt', 'help' },
        use_mode_colors = false,
        filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha'
        }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
    }},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {{
        'tabs',
        mode = 0,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    }},
  },

  winbar = {
    lualine_a = {'branch'},
    lualine_b = {
        {
            'filename',
            path = 3,
            file_status = false
        }
    },
    lualine_c = {{
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
        'branch',
        {
            'filename',
            path = 3,
            file_status = false
        }
    },
    lualine_b = {'%R%H%W%M'},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'filesize'},
    lualine_z = {
        {
            'filetype',
            colored = false,
            icon = {align = 'right'},
        },
    },
  },

  extensions = { 'nvim-tree', 'fugitive' }
}
