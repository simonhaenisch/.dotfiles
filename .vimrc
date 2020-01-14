syntax on
colorscheme peachpuff

set backspace=indent,eol,start

set tabstop=2
set shiftwidth=1

set laststatus=2

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'
Plug 'Quramy/tsuquyomi'

call plug#end()
