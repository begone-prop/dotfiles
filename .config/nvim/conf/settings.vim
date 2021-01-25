syntax on
set encoding=utf-8
set number relativenumber
set autoread
set nowrap
set incsearch
set nohlsearch
set nocompatible
"set cursorline
set clipboard+=unnamedplus

set smartindent
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set updatetime=50

filetype plugin on
set laststatus=2
set noshowmode
set viminfo+='1000,n$XDG_DATA_HOME/nvim/nviminfo
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufWritePost ~/.Xresources !xrdb %

" Delete trailing whitespace and newlines
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
