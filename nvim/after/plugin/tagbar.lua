vim.g.tagbar_position = 'topleft vertical'
vim.g.tagbar_compact = 1
vim.g.tagbar_show_visibility=0
vim.g.tagbar_no_status_line = 1
vim.g.tagbar_iconchars = {'▶', '▼'}
vim.g.tagbar_scopestrs = {
   class = '',
   const = '',
   constant = '',
   enum = '',
   field = '',
   func = '󰊕',
   ['function'] = '󰊕',
   getter = '󰊪',
   implementation = '',
   interface = '',
   map = '',
   member = '󱎥',
   method = '󰡱',
   setter = '󰖷',
   variable = '',
}

vim.keymap.set('n', '<leader>o', ':TagbarToggle<CR>', { silent = true })
