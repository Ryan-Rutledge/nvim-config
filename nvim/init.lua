vim.g.mapleader = ' '

require('plugins')

vim.cmd[[colorscheme tokyonight-night]]
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
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
vim.opt.signcolumn = 'auto'

vim.opt.guifont='FiraCode Nerd Font'
vim.opt.numberwidth = 2
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.showtabline = 1

vim.g._macro_str = ''
vim.api.nvim_create_autocmd({'ModeChanged'}, { callback = function(_) vim.schedule(function() vim.cmd('redraw') end) end })  -- fixes statusline flash on mode change
vim.api.nvim_create_autocmd('RecordingEnter', { callback = function() vim.g._macro_str = '@' .. vim.fn.reg_recording() end })
vim.api.nvim_create_autocmd('RecordingLeave', { callback = function() vim.g._macro_str = '' end })
vim.api.nvim_create_autocmd('FileType', { pattern = 'help', callback = function() vim.opt_local.statusline = '%t%#StatusLineDither#%{(v:hlsearch?_search_progress():" ")}%=%y' end })
function vim.g._search_progress() if vim.fn.searchcount().current > 0 then return string.format(' [%d/%d] ', vim.fn.searchcount().current, vim.fn.searchcount().total) else return '' end end
vim.opt.statusline = '%#StatusLineFlags#%m%w%q%h%*%f%#StatusLineDither#%{(v:hlsearch?_search_progress():" ")}%#StatusLineRecording#%{g:_macro_str}%#StatusLineShowCmd#%S%=%7(%#StatusLinePosition#%l,%-3c%) %10(%#StatusLineCharCode#%b U+%04B%) %#StatusLineFileMeta#%{&fileencoding}%{(&bomb?"BOM":"")} %{&fileformat}%* %Y'

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
            vim.fn.chansend(_TermChannel, ' cd ' .. vim.fn.expand('%:p:h') .. '\n')
        end
    end,
})
vim.api.nvim_create_autocmd({'TermClose'}, {
    callback = function(_) _TermChannel = nil end
})

local mopts = { silent = true, noremap = true }
vim.keymap.set('n', 'Y', 'y$', mopts)
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', '<leader>L', function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end, mopts)
vim.keymap.set('n', '<leader>l', function() vim.opt.number = not vim.opt.number:get() end, mopts)

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>', mopts)
vim.keymap.set('n', '<leader>CD', ':cd ..<CR>', mopts)

vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz', mopts)
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz', mopts)
vim.keymap.set('n', '<leader>`' , function() vim.cmd('b #') end, mopts)
vim.keymap.set('n', '<leader>gg', function()
    vim.o.signcolumn = vim.o.signcolumn == 'auto' and 'no' or 'auto'
end, mopts)

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

pcall(require, 'custom')
