vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('colors')
require('remap')


-- general support
vim.opt.cmdheight = 0
-- vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.showmatch = false
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.expandtab  = true
vim.opt.autoindent  = true
vim.opt.cindent  = true
vim.opt.cinkeys:remove({'0', '#'})
vim.opt.indentkeys:append({'0', '#'})
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 1
vim.opt.foldtext = ''
vim.opt.foldenable = false
vim.opt.mps:append({'<:>'})

vim.opt.guifont="FiraCode Nerd Font"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- flash yanked text
vim.api.nvim_create_autocmd({'TextYankPost'}, {
    callback = function(_)
        vim.highlight.on_yank({higroup="IncSearch", timeout=120})
    end
})

-- numbers in help pages
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'help',
    callback = function(_)
        vim.opt.number = true
    end
})

-- formatter
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'python',
    callback = function(_)
        vim.opt_local.formatprg = 'black -q -'
    end
})
