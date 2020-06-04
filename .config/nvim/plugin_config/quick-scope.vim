let g:qs_highlight_on_keys = ['f', 'F']

" this needs to be before colorscheme for it to take effect
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
augroup END
