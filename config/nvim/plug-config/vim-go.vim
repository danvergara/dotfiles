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
