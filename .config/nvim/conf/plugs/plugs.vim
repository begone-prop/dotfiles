" Plugins:
"Install(for nvim onlyl):
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'cespare/vim-toml'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-repeat'
Plug 'edkolev/tmuxline.vim'
Plug 'mattn/emmet-vim'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-python/python-syntax'
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim', {'do': 'npm install -prefix server'}
Plug '~/.config/nvim/autoload/plugged/dracula_pro'
call plug#end()

"Inactive:
"Plug 'arcticicestudio/nord-vim'
"Plug 'rafi/awesome-vim-colorschemes'
"Plug 'junegunn/goyo.vim'
"Plug 'preservim/nerdtree'
"Plug 'https://gitlab.com/ceda_ei/vcf.vim.git'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'itchyny/lightline.vim'
"Plug 'ryanoasis/vim-devicons'
