set nocompatible  |" use Vim settings, rather than Vi
let g:powerline_pycmd="py3"

syntax on  |" syntax highlighting
filetype plugin on  |" allow nerdcommenter
set autoread  |" changes from outside are reflected
set showcmd  |" show what command was entered
set spell spelllang=en_us  |" spell checker
set backspace=indent,eol,start  |" make backspace behave in a sane manner
set hidden  |" allow hidden buffers, don't limit to 1 file per window/split
set number  |" show line numbers

" shortcuts
map <SPACE> <leader>
inoremap jj <Esc>
autocmd Filetype help nnoremap <buffer> <cr> <c-]>  |" make enter follow tags in help files

nnoremap <leader>f :CtrlP<CR>  |" find a file
nnoremap <leader><space> :CtrlPBuffer<CR>  |" find a buffer
nnoremap <leader>t :CtrlPTag<CR>  |" find something (class, function etc.)

" searches
set incsearch
set hlsearch
:nnoremap <CR> :nohlsearch<CR><CR>

" NERDTree
nnoremap <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" CtrlP
let g:ctrlp_show_hidden=1  |" show hidden files
set shell=/bin/bash  |" required

" Ctags
let g:vim_tags_auto_generate = 1

" YCM
nnoremap <leader>d :YcmCompleter GetDoc<CR><C-w><C-w>  |" display the docstring
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> |" go to decalaration of variables

let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:ycm_autoclose_preview_window_after_insertion=1

" Tabs & spaces
set modeline
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" Imports
source ~/code/dotfiles/vundle.vim
source ~/code/dotfiles/python.vim
source ~/code/dotfiles/appearance.vim
