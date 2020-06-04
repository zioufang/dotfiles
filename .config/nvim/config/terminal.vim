tnoremap <Esc> <C-\><C-N>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>
tnoremap <C-H> <C-\><C-N><C-W><C-H>

nnoremap <leader>t :call ToggleTerm("default")<Cr>
function! ToggleTerm(termname)
	let pane = bufwinnr(a:termname)
	let buf = bufexists(a:termname)
	if pane > 0
		exe pane . "wincmd c"
	elseif buf > 0
		exe "split"
		exe "resize 15"
		exe "buffer " . a:termname
		exe "normal! i"
	else
		" if is a git repo, then use project root folder
		" else use original vim path
		try
			exe ":cd %:h | exe 'cd ' . fnameescape(get(systemlist('git rev-parse --show-toplevel'), 0))"
		catch
			echo "This is NOT a git repo"
		endtry
		exe "split"
		exe "resize 15"
		:terminal
		exe "f " a:termname
		exe "normal! i"
	endif
endfunction

