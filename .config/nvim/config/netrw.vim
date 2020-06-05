" NETRW
" better preview, with file explorer to the left with 20% width
set wildignore+=.pyc,.git,venv,.ipynb_checkpoints,__pycache__ 	" used to hide files for vim-vinegar
let g:netrw_liststyle=3
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_winsize = 15
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'        " enable line number

" use p to preview
" toggle netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction
noremap <F2> :call ToggleNetrw()<CR>

" keybindings in netrw
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> <C-L> <C-W><C-L>
endfunction



