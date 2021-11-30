let g:deoplete#enable_at_startup = 1

" automatically close the method preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" navigate through the auto-completion list with Tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
