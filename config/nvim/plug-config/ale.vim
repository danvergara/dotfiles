let g:ale_linters = {
      \   'python': [],
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
