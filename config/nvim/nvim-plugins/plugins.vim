call plug#begin("~/.vim/plugged")
"Our plugins will go in the middle
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'
Plug 'dense-analysis/ale'
Plug 'neomake/neomake'
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
call plug#end()
