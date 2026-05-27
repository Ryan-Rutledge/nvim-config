local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({gh('folke/tokyonight.nvim')})
vim.pack.add({gh('folke/flash.nvim')})
vim.pack.add({gh('mbbill/undotree')})
vim.pack.add({gh('tpope/vim-fugitive')})
vim.pack.add({gh('preservim/nerdcommenter')})
vim.pack.add({gh('lewis6991/gitsigns.nvim')})
vim.pack.add({gh('ray-x/lsp_signature.nvim')})
vim.pack.add({gh('brenoprata10/nvim-highlight-colors')})
vim.pack.add({{ src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range('^9') }})
vim.pack.add({
    gh('nvim-lua/plenary.nvim'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('nvim-treesitter/nvim-treesitter-context'),
    gh('nvim-treesitter/nvim-treesitter-textobjects'),
})
vim.pack.add({gh('folke/snacks.nvim')})
vim.pack.add({gh('folke/todo-comments.nvim')})
vim.pack.add({gh('folke/todo-comments.nvim')})
vim.pack.add({
    gh('rafamadriz/friendly-snippets'),
    { src = gh('saghen/blink.cmp'), version = vim.version.range('1.*') }
})
vim.pack.add({
    gh('mason-org/mason.nvim'),
    gh('mason-org/mason-lspconfig.nvim'),
    gh('stevearc/conform.nvim'),
})

-- vim.pack.add({gh('vim-test/vim-test')})
vim.pack.add({
    gh('antoinemadec/FixCursorHold.nvim'),
    gh('nvim-treesitter/nvim-treesitter'),
    gh('nvim-neotest/nvim-nio'),
    gh('nvim-neotest/neotest'),
    gh('nvim-neotest/neotest-python'),
})
vim.pack.add({
    gh('mfussenegger/nvim-dap'),
    gh('mfussenegger/nvim-dap-python'),
    { src = gh('igorlfs/nvim-dap-view'), version = vim.version.range('1.*')  }
})

require('plugins.tokyonight')
require('plugins.flash')
require('plugins.snacks')
require('plugins.todo-comments')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.undotree')
require('plugins.fugitive')
require('plugins.nerdcommenter')
require('plugins.gitsigns')
require('plugins.nvim-treesitter-context')
require('plugins.nvim-treesitter-textobjects')
-- require('vim-test')
require('plugins.neotest')
require('plugins.dap')
require('plugins.statusline')
