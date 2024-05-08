vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins')
require('colors')
require('remap')

-- general support
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

vim.opt.guifont='FiraCode Nerd Font'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- diagnostic icons
vim.fn.sign_define('DiagnosticSignError', {icon='󰏃', text='󰏃', texthl='DiagnosticError'})
vim.fn.sign_define('DiagnosticSignWarn', {icon='󰔶', text='󰔶', texthl='DiagnosticWarn'})
vim.fn.sign_define('DiagnosticSignInfo', {icon='󰌵', text='󰌵', texthl='DiagnosticInfo'})
vim.fn.sign_define('DiagnosticSignHint', {icon='', text='', texthl='DiagnosticHint'})

-- terminal
_TermChannel = nil
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


-- flash yanked text
vim.api.nvim_create_autocmd({'TextYankPost'}, {
    callback = function(_)
        vim.highlight.on_yank({higroup='TodoBgPERF', timeout=150})
    end
})

-- numbers in help pages
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'help',
    callback = function(_)
        vim.opt.number = true
        vim.opt_local.relativenumber = false
    end
})

-- formatter
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = 'python',
    callback = function(_)
        vim.opt_local.formatprg = 'black -q -'
    end
})
