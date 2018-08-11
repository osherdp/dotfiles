" ----------------
" Vundle (plugins)
" ----------------
filetype off  |" required
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" general
Plugin 'VundleVim/Vundle.vim'  |" plugin manager
Plugin 'scrooloose/nerdtree'  |" files displayer
Plugin 'Valloric/YouCompleteMe'  |" auto completer
Plugin 'ntpeters/vim-better-whitespace'  |" handle whitespaces
Plugin 'scrooloose/nerdcommenter'  |" comment and uncomment
Plugin 'scrooloose/syntastic'  |" style checker
Plugin 'kien/ctrlp.vim'  |" fuzzy file finder
Plugin 'tpope/vim-fugitive'  |" git manager
Plugin 'ludovicchabant/vim-lawrencium'  |" mercurial manager
Plugin 'szw/vim-tags'  |" search tool

" python
Plugin 'klen/python-mode'  |" python
Plugin 'plytophogy/vim-virtualenv'  |" activating virtualenvs
"Plugin 'dbsr/vimpy'  |" auto import

" appearance
Plugin 'morhetz/gruvbox'  |" color scheme
Plugin 'bling/vim-airline'  |" status line

call vundle#end()
filetype plugin indent on  |" required
