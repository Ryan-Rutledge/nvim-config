local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Libraries
Plug('nvim-lua/plenary.nvim')  -- common library
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })  -- parsing library
Plug('nvim-treesitter/nvim-treesitter-textobjects', { run = ':TSUpdate' })  -- parsing library
-- Plug('nvim-treesitter/playground', { run = ':TSUpdate' })

-- Navigation
Plug('nvim-telescope/telescope.nvim')  -- fuzzy search
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('mbbill/undotree')  -- undo visualizer
Plug('folke/flash.nvim') -- search navigation

-- View
Plug('nvim-tree/nvim-tree.lua')  -- file explorer
Plug('nvim-tree/nvim-web-devicons')  -- file explorer icons
Plug('nvim-lualine/lualine.nvim')  -- statusline/windowline/tabline customization
Plug('MunifTanjim/nui.nvim')  -- ui components
Plug('folke/todo-comments.nvim') -- comment tag highlights/search

-- Git
Plug('tpope/vim-fugitive')  -- git tooling
Plug('lewis6991/gitsigns.nvim')  -- git visual/movement

-- Misc
Plug('preservim/nerdcommenter')  -- comment lines shortcuts
Plug('vim-test/vim-test')

-- LSP/cmp
Plug('williamboman/mason.nvim', { run = ':MasonUpdate' })
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('ray-x/lsp_signature.nvim')
-- Plug('L3MON4D3/LuaSnip', {['tag'] = 'v2.*', ['do'] = 'make install_jsregexp'})
-- Plug('saadparwaiz1/cmp_luasnip')
-- Plug('folke/neodev.nvim') -- vim dev lua support

-- colorschemes
Plug('folke/tokyonight.nvim', { branch = 'main', as = 'tokyonight' })

vim.call('plug#end')
