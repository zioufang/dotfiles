" install fd-find and ripgrep
" use bat for syntax hightlight in preview
noremap <leader>f :FzfFiles<Cr>
noremap <leader>g :FzfGFiles<Cr>
" noremap <leader>? :let g:fzf_layout = { 'down': '~90%' } <bar> FzfRg<Cr>
noremap <leader>? :FzfRg<Cr>
noremap <leader>/ :FzfBLines<Cr>

let g:fzf_history_dir = '~/.local/share/fzf-hist'	" enable history browsing with Ctrl+P/N
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~70%' }

" customized Rg
command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -g "!.git/" -g "!venv/" -g "!vendor/" -- '.shellescape(<q-args>),
  \   1, s:p(<bang>0), <bang>0)

function! s:p(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction
