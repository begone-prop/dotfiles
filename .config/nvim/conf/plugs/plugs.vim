" Plugins:
"Install(for nvim onlyl):
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-repeat'
Plug 'edkolev/tmuxline.vim'
Plug 'ap/vim-css-color'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'turbio/bracey.vim', {'do': 'npm install -prefix server'}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"Inactive:
"Plug 'cespare/vim-toml'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'junegunn/goyo.vim'
"Plug 'preservim/nerdtree'
"Plug 'https://gitlab.com/ceda_ei/vcf.vim.git'
"Plug 'itchyny/lightline.vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"Plug 'dylanaraps/wal.vim'
"Plug 'vim-python/python-syntax'
"Plug 'arcticicestudio/nord-vim'
"Plug '~/.config/nvim/autoload/plugged/dracula_pro'
"Plug 'pangloss/vim-javascript'
"Plug 'zeekay/vim-beautify'
"Plug 'prettier/vim-prettier'
