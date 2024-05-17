vim.loader.enable()
vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')

vim.opt.cmdheight = 0
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
vim.opt.formatoptions:remove({'c', 'r', 'o'})

vim.opt.guifont='FiraCode Nerd Font'
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.showtabline = 1

-- terminal
local _TermChannel = nil
vim.api.nvim_create_autocmd({'TermOpen'}, {
    callback = function(_)
        _TermChannel = vim.o.channel
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end
})
vim.api.nvim_create_autocmd({'DirChanged'}, {
    callback = function(_)
        if _TermChannel ~= nil then
            vim.fn.chansend(_TermChannel, ' cd ' .. vim.fn.expand("%:p:h") .. '\n')
        end
    end,
})
vim.api.nvim_create_autocmd({'TermClose'}, {
    callback = function(_) _TermChannel = nil end
})

-- numbers in help pages
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'help',
    callback = function(_)
        vim.opt.number = true
        vim.opt_local.relativenumber = false
    end
})

local mopts = { silent = true, noremap = true }

-- formatter
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'python',
    callback = function(_)
        vim.opt_local.formatprg = 'black -q -'
    end
})

vim.keymap.set('n', 'U', '<C-r>', mopts)
vim.keymap.set('n', 'Y', 'y$', mopts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>L', ':set relativenumber!<CR>', mopts)
vim.keymap.set('n', '<leader>l', ':set number!<CR>', mopts)
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>', mopts)
vim.keymap.set('n', '<leader>CD', ':cd ..<CR>', mopts)
vim.keymap.set('n', '<leader>%', ':call setreg("+", expand("%:p:h"))<CR>', mopts)
vim.keymap.set('n', '<leader>q', ':helpclose<CR>', mopts)

-- movement
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', mopts)
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', mopts)
vim.keymap.set('n', '<leader>-' , ':bp|bd #<CR>', mopts)
vim.keymap.set('n', '<leader>`' , ':b #<CR>', mopts)

-- paste
vim.keymap.set('x', '<leader>p', '"_dp', mopts)
vim.keymap.set('x', '<leader>P', '"_dP', mopts)
vim.keymap.set('x', '<leader>s', '"_ds', mopts)
vim.keymap.set('x', '<leader>S', '"_dS', mopts)

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- terminal
vim.keymap.set(
    'n', '<C-\\>',
    function()
        if not pcall(function() vim.cmd(':b term://') end) then
            vim.api.nvim_command('terminal')
        end

        vim.cmd('startinsert')
    end,
    mopts
)
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', mopts)
vim.keymap.set('t', '<C-\\>', '<C-\\><C-N>:b #<CR>', mopts)
vim.keymap.set('t', '<M-f>', function()
    vim.fn.chansend(vim.o.channel, ' cd ' .. vim.fn.expand("#:p:h") .. '\n')
end, mopts)
