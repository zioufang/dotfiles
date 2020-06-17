let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'bufnum' ],
    \             [ 'path_n_modified' ] ],
    \   'right': [ ['lineinfo'], ['percent'], ['filetype']
    \            ]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'bufnum' ], [ 'path_n_modified' ] ],
    \   'right': [ ['lineinfo'] ]
    \ },
    \ 'component': { 'path_n_modified': '%<%F%*%m%*', "bufnum": '%n'},
    \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
    \ }
\ }
