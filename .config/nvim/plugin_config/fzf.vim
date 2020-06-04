" install fd-find and ripgrep
noremap <leader>f :Files<Cr>
noremap <leader>g :GFiles<Cr>
noremap <leader>r :Rg<Cr>
noremap <leader>b :Buffers<Cr>

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = '~/.local/share/fzf-hist'	" enable history browsing with Ctrl+P/N
