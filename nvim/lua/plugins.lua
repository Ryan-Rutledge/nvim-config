local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Libraries
Plug('nvim-lua/plenary.nvim')  -- common library
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })  -- parsing library
-- Plug('nvim-treesitter/playground', { run = ':TSUpdate' })

-- Navigation
Plug('nvim-telescope/telescope.nvim')  -- fuzzy search
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
Plug('mbbill/undotree')  -- undo visualizer

-- View
Plug('nvim-tree/nvim-web-devicons')  -- icons
Plug('nvim-tree/nvim-tree.lua')  -- file explorer
Plug('simrat39/symbols-outline.nvim') -- object explorer
-- Plug('nvim-treesitter/nvim-treesitter-context')  -- sticky headers
Plug('lukas-reineke/indent-blankline.nvim')  -- context highlighter
Plug('nvim-lualine/lualine.nvim')  -- statusline/windowline/tabline customization
Plug('MunifTanjim/nui.nvim')  -- ui components
Plug('folke/noice.nvim') -- pretty input bar

-- Git
Plug('tpope/vim-fugitive')  -- git tooling
Plug('lewis6991/gitsigns.nvim')  -- git visual/movement

-- Misc
Plug('preservim/nerdcommenter')  -- comment lines shortcuts
Plug('akinsho/toggleterm.nvim')
Plug('vim-test/vim-test')

-- LSP Support
Plug('neovim/nvim-lspconfig')
Plug('williamboman/mason.nvim', { run = ':MasonUpdate' })
Plug('williamboman/mason-lspconfig.nvim')

-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v2.x' })
Plug('ray-x/lsp_signature.nvim')
Plug('folke/neodev.nvim') -- vim dev lua support

-- colorschemes
Plug('folke/tokyonight.nvim', { branch = 'main', as = 'tokyonight' })

vim.call('plug#end')
