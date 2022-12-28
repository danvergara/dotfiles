let g:ale_linters = {
      \   'python': [],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'elixir': ['mix_format'],
      \}

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
