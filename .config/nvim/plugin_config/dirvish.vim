nmap _ <Plug>(dirvish_vsplit_up)

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish
    \  map <silent><buffer> q <Plug>(dirvish_quit)
augroup END
