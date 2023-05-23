" generic config
set scrolloff=8
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set encoding=utf8

" colorscheme
colorscheme onedark
set background=dark

" Define leader
let mapleader=","

" Turn on line numbers
set relativenumber

" Split navigation
set splitbelow
set splitright

" Python identation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
