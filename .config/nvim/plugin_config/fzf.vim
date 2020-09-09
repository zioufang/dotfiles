" install fd-find and ripgrep
" use bat for syntax hightlight in preview
noremap <leader><Space> :FzfGFiles<Cr>
noremap <leader>b :FzfBuffers<Cr>
" alt-a<cr> save to quickfix list
" ' for exact match
noremap <leader>? :FzfRg<Cr>'
noremap <leader>/ :FzfBLines<Cr>'

let g:fzf_history_dir = '~/.local/share/fzf-hist'	" enable history browsing with Ctrl+P/N
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~70%' }

command! -bang FzfProjectFiles call fzf#vim#files('~/projects', <bang>0)
:command! FF FzfProjectFiles

" customized Rg
" the options setting is for ignoring searching in filename
" https://github.com/junegunn/fzf.vim/issues/346
command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden -g "!.git/" -g "!venv/" -g "!vendor/" -g "!go.sum" -g "!go.mod" -- '.shellescape(<q-args>),
  \   1, {'options': '--delimiter : --nth 4..'}, <bang>0)

function! s:p(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction

