" ----------
" appearance
" ----------
" 24 bit (true) colors:
"let &t_8f="\e[38;2;%ld;%ld;%ldm"
"let &t_8b="\e[48;2;%ld;%ld;%ldm"
"set guicolors

" regular colors:
set t_Co=256

" dark gruvbox color scheme
colorscheme gruvbox
set background=dark

" -------
" airline
" -------
set laststatus=2
let g:airline_powerline_fonts=1
