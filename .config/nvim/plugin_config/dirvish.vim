nmap _ <Plug>(dirvish_vsplit_up)

" folders at the top
let g:dirvish_mode = ':sort ,^.*[\/],'

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
    \  map <silent><buffer> q <Plug>(dirvish_quit)
  autocmd FileType dirvish
    \  map <buffer> % :e %
augroup END
