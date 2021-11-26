set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-vinegar'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'dense-analysis/ale'
Plugin 'joshdick/onedark.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'uarun/vim-protobuf'
Plugin 'preservim/nerdtree'
Plugin 'elzr/vim-json'
Plugin 'hashivim/vim-terraform'
call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
call plug#end()

let mapleader=","

" Split navigation
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Python identation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Js html css
au BufNewFile,BufRead *.html,*.css
   \ set tabstop=2 |
   \ set softtabstop=2 |
   \ set shiftwidth=2 |
   \ set autoindent |

au BufNewFile,BufRead *.vue,*.js
  \ set expandtab | 
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |

" Make the code prettier
let python_highlight_all=1
syntax on
colorscheme onedark

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 support
set encoding=utf-8

" Turn on line numbers
set nu

" ctrlp config
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" markdown-preview config
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='firefox'
let vim_markdown_preview_github=1

" vim-go config
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
" I’ve mapped running all the tests in the current file to <leader>-t which translates to \ + t on my Mac & Linux.
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
" I’ve also mapped \ + tt to run the current test function only, instead of running all of them:
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
" Finally, I use \ + c to toggle the coverage profile for the current file I’m in:
autocmd BufEnter *.go nmap <leader>c  <Plug>(go-coverage-toggle)
" Show the function signature for a given routine with \ + i:
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
" Show the interfaces a type implements with \ + ii:
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
" Describe the definition of a given type with \ + ci:
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
" See the callers of a given function with \ + cc:
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
" Find all references of a given type/function in the codebase with \ + cr:
nmap <leader>cr <Plug>(coc-references)
" Not many options here, but there’s renaming the symbol your cursor is on with \ + r:
nmap <leader>r <Plug>(coc-rename)

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
"  run go imports on file save
let g:go_fmt_command = "goimports"
" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" For syntax highlighting, use these options:
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" coc config
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" Ale linters
let g:ale_linters = {
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \   'vue': ['eslint'],
      \   'elixir': ['mix_format'],
      \}
let g:ale_fixers = {'vue': ['remove_trailing_lines', 'trim_whitespace']}
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'
let g:ale_fix_on_save = 1

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}

" Shows the total number of warnings and errors in the status line.
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" nerdcommenter settings
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" ripgrep integration
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" map a specific key or shortcut to open NERDTree?
map <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" nerd tree settings
let NERDTreeIgnore=['\.pyc$', '\~$']

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
