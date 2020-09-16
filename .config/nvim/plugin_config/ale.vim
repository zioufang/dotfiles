" let g:ale_linter_aliases = {'yaml': ['cloudformation', 'yaml', 'j2']}
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'go': ['golint'],
    \ 'terraform': ['tflint'],
    \ 'sh': ['language_server'],
    \ }
let g:ale_completion_enabled = 0
let g:ale_python_flake8_options = '--ignore=E501'	" ignore 'lines too long' error

map <F5> :ALEReset<Cr>
map <silent> ]l <Plug>(ale_next_wrap)
map <silent> [l <Plug>(ale_previous_wrap)
