autocmd BufWrite *.py 0,$!yapf
nnoremap <leader>i :call ToggleRepl("ipython3")<Cr>

function! ToggleRepl(repl)
	let pane = bufwinnr(a:repl)
	let buf = bufexists(a:repl)
	if pane > 0
		exe pane . "wincmd c"
	elseif buf > 0
		split
		resize 20
		exe "buffer " . a:repl
		let l:repl_job_id = b:terminal_job_id
		" Go back to the previous window and set jobid
		exe 'normal!' . "\<C-W>p"
		let b:slime_config = {'jobid': l:repl_job_id}
	else
		try
		    exe ":cd %:h | exe 'cd ' . fnameescape(get(systemlist('git rev-parse --show-toplevel'), 0))"
            if isdirectory('venv')
		        exe "split | term source venv/bin/activate && " . a:repl
            else
                exe "split | term " . a:repl
            endif
		catch
            if isdirectory('venv')
		        exe "split | term source venv/bin/activate && " . a:repl
            else
                exe "split | term " . a:repl
            endif
        endtry
        resize 20
		exe "f " a:repl
		let l:repl_job_id = b:terminal_job_id
		" Go back to the previous window and set jobid
		exe 'normal!' . "\<C-W>p"
		let b:slime_config = {'jobid': l:repl_job_id}
		" if repl is ipython3 then enable autoload
		if a:repl == "ipython3"
			call chansend(l:repl_job_id, "%load_ext autoreload\<Cr>")
			call chansend(l:repl_job_id, "%autoreload 2\<Cr>")
		endif
	endif
endfunction
