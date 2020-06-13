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
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ }
\ }

" lightline-bufferline extension
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filename_modifier = ':t'  " show file name with path
