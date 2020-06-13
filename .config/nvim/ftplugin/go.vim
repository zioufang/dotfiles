" highlight link goFunctionCall goBuiltins
" highlight link goType Aqua
" highlight link goExtraType goType
" highlight link goOperator Orange
" autocmd ColorScheme * highlight link goBuiltins Blue
" autocmd ColorScheme * highlight link goDeclType goDeclaration

au! BufWritePost *.go call CodeFormat("goimports")

" vim-go config
" let g:go_fmt_command = "goimports"
" let g:go_term_mode = "split"
" let g:go_term_height = 5
" let g:go_def_mapping_enabled = 0 " this is done by coc
" let g:go_highlight_extra_types = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" nmap <leader>r <Plug>(go-run)<C-j>
" nmap <leader>d <Plug>(go-def-vertical)
