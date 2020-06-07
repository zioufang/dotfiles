" install fd-find and ripgrep
" use bat for syntax hightlight in preview
noremap <leader>f :let g:fzf_layout = { 'down': '~30%' } <bar> Files<Cr>
noremap <leader>g :let g:fzf_layout = { 'down': '~30%' } <bar> GFiles<Cr>
noremap <leader>b :let g:fzf_layout = { 'down': '~30%' } <bar> Buffers<Cr>
noremap <leader>r :let g:fzf_layout = { 'down': '~90%' } <bar> Rg<Cr>
noremap <leader>l :let g:fzf_layout = { 'down': '~90%' } <bar> BLines<Cr>

let g:fzf_history_dir = '~/.local/share/fzf-hist'	" enable history browsing with Ctrl+P/N
