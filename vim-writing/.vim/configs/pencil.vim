" Writing tools
Plug 'reedes/vim-pencil'
let g:airline_section_x = '%{PencilMode()}'
let g:pencil#mode_indicators = {'hard': 'H', 'auto': 'A', 'soft': 'S', 'off': '',}
autocmd BufRead *.txt call pencil#init({'wrap': 'hard', 'textwidth': 74, 'autoformat': 0})
                \| setlocal spell
autocmd FileType markdown call pencil#init({'wrap': 'hard', 'textwidth': 74, 'autoformat': 0})
                \| setlocal spell

