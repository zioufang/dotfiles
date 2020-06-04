function! TrimWhitespace()
  " trailing whitespaces have meaning in markdown so don't try there
  let blacklist = ['markdown', 'rst', 'md']
  if index(blacklist, &filetype) < 0
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endif
endfunction

autocmd BufWritePre * call TrimWhitespace()

""" Python autocommands
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 |
    \ set foldmethod=indent |
    \ set foldlevel=99 |

au BufNewFile,BufRead *.yaml,*.yml,*.j2
    \ set syntax=yaml |
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

""" Web Dev autocommands
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
