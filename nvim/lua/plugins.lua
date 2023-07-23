local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Libraries
Plug('nvim-lua/plenary.nvim')  -- common library
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })  -- parsing library

-- Navigation
Plug('nvim-telescope/telescope.nvim')  -- fuzzy search
Plug('ThePrimeagen/harpoon')  -- quick file switching
Plug('mbbill/undotree')  -- undo visualizer
Plug('preservim/tagbar')  -- object explorer

-- View
Plug('nvim-tree/nvim-web-devicons')  -- icons
Plug('nvim-tree/nvim-tree.lua')  -- file explorer
Plug('nvim-treesitter/nvim-treesitter-context')  -- sticky headers
Plug('lukas-reineke/indent-blankline.nvim')  -- context highlighter
Plug('nvim-lualine/lualine.nvim')  -- statusline/windowline/tabline customization

-- Git
Plug('tpope/vim-fugitive')  -- git tooling
Plug('lewis6991/gitsigns.nvim')  -- git visual/movement

-- Misc
Plug('preservim/nerdcommenter')  -- comment lines shortcuts
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

-- colorschemes
Plug('folke/tokyonight.nvim', { branch = 'main', as = 'tokyonight' })

vim.call('plug#end')
