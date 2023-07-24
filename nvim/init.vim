let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

lua require('plugins')
lua require('colors')
lua require('remap')
lua require('init')

" general support
au BufRead,BufNewFile bash-fc-* set filetype=sh
set syntax
set mouse=a
set backupdir=~/.vim/backups
set directory=~/.vim/swapfiles

set cmdheight=0
set backspace=indent,eol,start
set lazyredraw
set linebreak
set noshowmatch
set nowrap
set splitright
set splitbelow
set wildmenu 
set wildmode=longest:full,full
set shiftround 
set shiftwidth=4
set softtabstop=4
set smarttab 
set tabstop=4
set expandtab 
set autoindent 
set cindent 
set cinkeys-=0#
set indentkeys-=0#
set incsearch
set ignorecase
set smartcase
set hlsearch
set foldmethod=indent
set foldnestmax=1
set foldtext=
set nofoldenable
set mps+=\<:\>

set guifont="FiraCode Nerd Font"
set number
set cursorline
set cursorcolumn

" current date abbreviation
iabbrev <expr> {DATE} strftime("%d/%m/%Y")
" current time abbreviation
iabbrev <expr> {TIME} strftime("%H:%M:%S")

" formatter
au FileType python setlocal formatprg=black\ -q\ -

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=250})
augroup END

