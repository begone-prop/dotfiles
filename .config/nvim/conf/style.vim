"General

if exists('+termguicolors')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[42;2;%lu;%lu;%lum"
endif

set t_Co=256
set background=dark
set termguicolors
let g:gruvbox_material_background = 'hard'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
let g:gruvbox_improved_strings = 0
let g:dracula_colorterm = 0
colorscheme gruvbox
highlight Normal guibg=none

"Airline
let g:airline_theme = 'violet'
let g:airline_powerline_fonts = 1
let g:airline#extension#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extension#tabline#formatter = 'default'


"Airline themes:
"simple light deus powerlineish solarized light solarized dark
"luna wombat molokai bubblegum jellybeans laederon ubaryd tomorrow
"base16 base16-spacemacs murmur sol papercolor cobalt 2 distinguished
"minimalist violet fruit punch angr badwolf base16 behelit bubblegum dark
"durant hybridline hybrid jellybeans kalisi kolor laederon light
"lucius luna molokai monochrome murmur papercolor powerlineish raven
"serene silver simple solarized sol term tomorrow ubaryd understated
"wombat zenburn
