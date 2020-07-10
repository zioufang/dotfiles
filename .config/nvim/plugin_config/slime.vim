let g:slime_target = "neovim"
let g:slime_python_ipython = 1

" send visual selection, jump to end of the previous visual selection then move
" to the next nonblank line before the last line of the file
xmap <leader>rr <Plug>SlimeRegionSend`>:call search('^.\+', '', line('$'))<Cr>
" send, jump to the end of paragraph then move to the next nonblank line
" before the last line file
nmap <leader>rr <Plug>SlimeParagraphSend}:call search('^.\+', '', line('$'))<Cr>
nmap <leader>rl <Plug>SlimeLineSend<Cr>
