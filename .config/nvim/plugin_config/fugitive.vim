noremap <leader>gg :G<Cr>
noremap <leader>gp :Gpush<Cr>
noremap <leader>gl :Glog<Cr><C-^>
noremap <leader>gr :Grebase --interactive <C-r><C-w><Cr>
noremap <leader>gf :G fetch origin<Cr>

:command! Gpf Gpush -f
:command! Ga G commit --amend --no-edit

"" Merge Conflict
" Mine vs Theirs
" i.e. Staged vs Unstaged
" Shift+x to pick
" s to stage the conflict resolve
