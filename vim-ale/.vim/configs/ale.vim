Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1

" Set specific linters
let g:ale_linters = {'ruby': ['rubocop']}

let g:ale_ruby_rubocop_executable = 'bundle'
