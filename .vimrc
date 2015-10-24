set nocompatible  |" use Vim settings, rather than Vi - must come first

" ----------------
" vundle (plugins)
" ----------------
filetype off  |" required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" general
Plugin 'gmarik/vundle'  |" plugin manager
Plugin 'scrooloose/nerdtree'  |" files displayer
Plugin 'Valloric/YouCompleteMe'  |" auto completer
Plugin 'ntpeters/vim-better-whitespace'  |" handle whitespaces
Plugin 'scrooloose/nerdcommenter'  |" comment and uncomment
Plugin 'scrooloose/syntastic'  |" style checker
Plugin 'kien/ctrlp.vim'  |" fuzzy file finder
Plugin 'tpope/vim-fugitive'  |" git manager
Plugin 'tpope/vim-surround'  |" handle surrounds editing
Plugin 'SirVer/ultisnips'  |" templates manager
Plugin 'ervandew/supertab'  |" manage the Tab key

" python
Plugin 'klen/python-mode'  |" several python enhancements
Plugin 'dbsr/vimpy'  |" auto import python modules

" appearance
Plugin 'morhetz/gruvbox'  |" best color scheme in the world
Plugin 'bling/vim-airline'  |" pretty & lightweight status line. preferred as last

call vundle#end()
filetype plugin indent on  |" required

" -------
" general
" -------
" make 'jk' and 'kj' exit insert mode
inoremap jk <Esc>
inoremap kj <Esc>

set autoread  |" changes from outside are reflected

syntax on  |" syntax highlighting
filetype plugin on  |" allow nerdcommenter

map <SPACE> <leader>
set showcmd  |" show what command was entered

set spell spelllang=en_us  |" spell checker

set backspace=indent,eol,start  |" make backspace behave in a sane manner

set hidden  |" allow hidden buffers, don't limit to 1 file per window/split

set number  |" line numbers
set relativenumber  |" relative line numbers

autocmd Filetype help nnoremap <buffer> <cr> <c-]>  |" make enter follow tags in help files

" -----
" theme
" -----
" 24 bit (true) colors
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set guicolors

" dark gruvbox color scheme
colorscheme gruvbox
set background=dark

" toggle between light & dark (doesn't work on tmux)
map <F6> :let &background=(&background=="dark"?"light":"dark")<CR><CR>

" -------
" airline
" -------
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme="tomorrow"

" --------
" nerdtree
" --------
nnoremap <C-e> :NERDTreeToggle<CR>

" -----
" vimpy
" -----
let g:vimpy_prompt_resolve=1  |" when not sure, vimpy asks
nnoremap <leader>i :VimpyCheckLine<CR>  |" auto import on current line

" ---------
" syntastic
" ---------
let g:syntastic_python_checkers=["python", "prospector"]

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_aggregate_errors=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_loc_list_height=4

let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_error_symbol="✗"
let g:syntastic_style_warning_symbol="⚠"

" -----
" ctrlp
" -----
nnoremap <leader>f :CtrlP<CR>  |" find a file on the current directory
nnoremap <leader><space> :CtrlPBuffer<CR>  |" find a buffer

let g:ctrlp_show_hidden=1  |" show hidden files
set shell=/bin/bash  |" required

" ---
" ycm
" ---
nnoremap <leader>d :YcmCompleter GetDoc<CR><C-w><C-w>  |" display the docstring

let g:ycm_key_list_select_completion=['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-k>', '<C-p>', '<Up>']

let g:ycm_autoclose_preview_window_after_insertion=1

" ---------
" ultisnips
" ---------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" make :UltiSnipsEdit split the window
let g:UltiSnipsEditSplit="vertical"

" ---------
" super-tab
" ---------
let g:SuperTabDefaultCompletionType='<C-n>'
let g:SuperTabCrMapping=0

" ------
" python
" ------
" rope
let g:pymode_rope=1  |" enable rope
let g:pymode_rope_completion=0  |" disable rope auto completion in favor of YCM
let g:pymode_rope_goto_definition_bind="<leader>g"
let g:pymode_rope_goto_definition_cmd="e"
let g:pymode_rope_rename_bind='<leader>r'
let g:pymode_rope_organize_imports_bind='<leader>o'
let g:pymode_rope_autoimport=0  |" disable auto import in favor of vimpy

let g:pymode_virtualenv=1  |" support virtualenv

" breakpoints plugin
let g:pymode_breakpoint=0  |" disable breakpoint plugin
nnoremap <leader>b Oimport ipdb; ipdb.set_trace()<ESC>

" syntax highlighting
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

let g:pymode_folding=0  |" don't automatically fold code
