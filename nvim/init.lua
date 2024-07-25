local rocks_config = {
    rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"), -- Remove the dylib and dll paths if you do not need macos or windows support
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "*", "*"))

require('rocks-config').configure('tokyonight')

vim.g.mapleader = ' '
vim.cmd[[colorscheme tokyonight]]
vim.opt.cmdheight = 0
-- vim.opt.laststatus = 3
vim.opt.showcmdloc = 'statusline'
vim.opt.showcmd = true
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
vim.opt.list = true
vim.opt.listchars = 'tab:-->,trail:,nbsp:█'
vim.opt.mps:append({'<:>'})
vim.opt.formatoptions:remove({'c', 'r', 'o'})
vim.opt.signcolumn = 'auto:3'

vim.opt.guifont='FiraCode Nerd Font'
vim.opt.numberwidth = 2
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.showtabline = 1

vim.g.macroStr = ''
vim.api.nvim_create_autocmd({'ModeChanged'}, { callback = function(_) vim.schedule(function() vim.cmd('redraw') end) end })  -- fixes statusline flash on mode change
vim.api.nvim_create_autocmd('RecordingEnter', { callback = function() vim.g.macroStr = '@' .. vim.fn.reg_recording() end })
vim.api.nvim_create_autocmd('RecordingLeave', { callback = function() vim.g.macroStr = '' end })
vim.api.nvim_create_autocmd('FileType', { pattern = 'help', callback = function() vim.opt_local.statusline = '%t%=%y' end })
vim.opt.statusline = '%#StatusLineFlags#%m%w%q%h%*%t%#StatusLineFilePath# %{expand("%:~:h")}%=%#StatusLineShowCmd#%S%#StatusLineRecording#%{g:macroStr} %7(%#StatusLinePosition#%l,%-3c%) %10(%#StatusLineCharCode#%b U+%04B%) %#StatusLineFileMeta#%{&fileencoding}%{(&bomb?"BOM":"")} %{&fileformat}%* %Y'

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

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', 'U', '<C-r>', mopts)
vim.keymap.set('n', 'Y', 'y$', mopts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>L', function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end, mopts)
vim.keymap.set('n', '<leader>l', function() vim.opt.number = not vim.opt.number:get() end, mopts)

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>', mopts)
vim.keymap.set('n', '<leader>CD', ':cd ..<CR>', mopts)
vim.keymap.set('n', '<leader>%', ':call setreg("+", expand("%:p:h"))<CR>', mopts)
vim.keymap.set('n', '<BS><F1>', ':helpclose<CR>', mopts)
vim.keymap.set('n', '<BS>q', ':cclose<CR>', mopts)
vim.keymap.set('n', '<BS>l', ':lclose<CR>', mopts)

vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', mopts)
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', mopts)
vim.keymap.set('n', '<leader>-' , ':bp|bd #<CR>', mopts)
vim.keymap.set('n', '<leader>`' , function() vim.cmd('b #') end, mopts)

vim.keymap.set('x', '<leader>p', '"_dp', mopts)
vim.keymap.set('x', '<leader>P', '"_dP', mopts)
vim.keymap.set('x', '<leader>s', '"_ds', mopts)
vim.keymap.set('x', '<leader>S', '"_dS', mopts)

vim.keymap.set('n', '<leader>"', 'ciw""<Esc>P', mopts)
vim.keymap.set('n', "<leader>'", "ciw''<Esc>P", mopts)

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

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

