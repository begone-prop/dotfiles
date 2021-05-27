" Mappings:
let mapleader = ' '

"Command

cmap <C-k> <UP>
cmap <C-j> <DOWN>


"" Splits
set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize +2<CR>
nnoremap <M-l> :vertical resize -2<CR>


"Run program/script
map <leader>r :w! \| !runner <c-r>%<CR>

"Shell
autocmd FileType sh nnoremap <leader>s :w<CR>:!shellcheck %<CR>
