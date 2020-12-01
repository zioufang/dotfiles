noremap <leader><Space> :G<Cr>
noremap <leader>gp :Gpush<Cr>
noremap <leader>gl :Glog<Cr><C-^>
noremap <leader>gf :G fetch origin<Cr>
noremap <leader>gr :G commit --fixup <C-r><C-w> <Bar> G rebase --interactive --autosquash <C-r><C-w>^1


:command! Gpf Gpush -f
:command! Ga G commit --amend --no-edit

"" Merge Conflict
" Mine vs Theirs
" i.e. Staged vs Unstaged
" Shift+x to pick
" s to stage the conflict resolve
