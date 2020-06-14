nmap <leader>hh :GitGutterToggle<Cr>
nmap <leader>hj <Plug>(GitGutterNextHunk)
nmap <leader>hk <Plug>(GitGutterPrevHunk)

nmap <leader>hf :GitGutterFold<Cr>
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

nmap <leader>hb :call GitGutterDiffBaseToggle('')<Left><Left>

" toggle diff base between HEAD and a specified branch (default to master)
function! GitGutterDiffBaseToggle(...)
    let l:branch = get(a:, 1, 'master')
    if g:gitgutter_diff_base == l:branch
        let g:gitgutter_diff_base = '' | GitGutter
        echom "DiffBase: HEAD"
    else
        let g:gitgutter_diff_base = l:branch | GitGutter
        echom "DiffBase: " . l:branch
    endif
endfunction

let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
