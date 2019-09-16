
"" Leaders
" f   : FZF Files
" g   : FZF GFiles
" b   : FZF Buffers
" s   : Slime Send Paragraph/Region to Repl
" l   : SLime send current line to Repl
" r   : Toggle Repl Terminal
" y   : Yank to system clipboard
" cd  : cd to current directory
" t   : Toggle 'default' terminal
" pg  : Jedi go to python definition
" pr  : Jedi rename python variable/function

"" F# Keys
" F2  : Toggle netrw
" F3  : Toggle search highlight
" F4  : Toggle GitGutter
" F11 : Toggle Maximize current window


""" PLUGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'			" better newrw
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'vim-scripts/indentpython.vim'             " better indent for python
Plug 'godlygeek/tabular'
Plug 'szw/vim-maximizer'
Plug 'jpalardy/vim-slime'						" REQUIRES nevim > 0.3

Plug 'dense-analysis/ale'
"Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
call plug#end()

colorscheme gruvbox

"" fzf
" install fd-find and ripgrep
noremap <leader>f :Files ~/projects<Cr>
noremap <leader>g :GFiles<Cr>
noremap <leader>b :Buffers<Cr>

let g:fzf_layout = { 'down': '~20%' }
let g:fzf_history_dir = '~/.local/share/fzf-hist'	" enable history browsing with Ctrl+P/N

"" ale
let g:ale_linter_aliases = {'yaml': ['cloudformation', 'yaml']}
let g:ale_linters = { 'python': ['flake8'] }
let g:ale_completion_enabled = 0
let g:ale_python_flake8_options = '--ignore=E501'	" ignore 'lines too long' error

"" deoplete
let g:deoplete#enable_at_startup = 1

"" jedi
let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0
"let g:jedi#use_splits_not_buffers = "right"
noremap <leader>pg :call jedi#goto()<Cr>
noremap <leader>pr :call jedi#rename()<Cr>

"" gitgutter
map <F4> :GitGutterToggle<Cr>
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0

"" indentline
" :IndentLinesToggle
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

"" sneak
let g:sneak#label = 1                           " EasyMotion behaviour

"" airline
let g:airline_section_c = 'b%n %<%F%*%m%*'      " buffer number, full path and modifier
let g:airline_section_z = 'c:%v L:%L'
let g:airline#extensions#ale#enabled = 1

"" maximizer
let g:maximizer_default_mapping_key = '<F11>'

"" supertab
let g:SuperTabNoCompleteAfter = ['^', ',', ';', '\s', '"', "'"]

"" slime,
let g:slime_target = "neovim"
let g:slime_python_ipython = 1

" send visual selection, jump to end of the previous visual selection then move
" to the next nonblank line before the last line of the file
xmap <leader>s <Plug>SlimeRegionSend`>:call search('^.\+', '', line('$'))<Cr>
" send, jump to the end of paragraph then move to the next nonblank line
" before the last line file
nmap <leader>s <Plug>SlimeParagraphSend}:call search('^.\+', '', line('$'))<Cr>
nmap <leader>l <Plug>SlimeLineSend<Cr>

nnoremap <leader>r :call ToggleRepl("ipython3")<Cr>

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
		    exe "split | term source venv/bin/activate && " . a:repl
		catch
            exe "split | term " . a:repl
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

"""""""""""""""""""""""""""""""""""""""""""""""""""


""" GENERAL
filetype plugin indent on
set scroll=15
set hidden                          " easy to switch buffers/files with unsaved changes
set ignorecase						" ignorecase while searching, use \C in the end to enforce case-sensitivity
set smartcase						" if pattern contains uppsecase, search is case-sensitve
set lazyredraw                      " lazyredraw, for macro performance
set undodir=~/.config/nvim/undodir
"set undofile


""" NETRW
set wildignore+=.pyc,.git,venv,.ipynb_checkpoints,__pycache__ 	" used to hide files for vim-vinegar
" better preview, with file explorer to the left with 20% width
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_winsize = 20

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


""" EDITOR
set background=dark
set splitbelow splitright
set number relativenumber
set noshowmode                      " disable the redundant show mode on the last line
set list                            " used to enable listchars below
set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
set nojoinspaces                    " no extra space after '.' when joining lines
set wildmode=longest,list,full      " better autocomplete in command mode
set diffopt=vertical				" git diff windows split to the side
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set formatoptions-=tc               " disable auto wrap while typing

""" LEADERS
noremap <leader>y "+y
noremap <leader>cd :cd %:p:h<Cr>


""" KEY MAPPINGS
map <Space> <leader>
inoremap jk <Esc>
noremap ; :

noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

noremap <C-Left> :vertical resize +5<Cr>
noremap <C-Right> :vertical resize -5<Cr>
noremap <C-Up> :resize +5<Cr>
noremap <C-Down> :resize -5<Cr>

" toggle search highlight
nmap <F3> :set hls!<Cr>
inoremap <F3> <C-O>:set hls!<Cr>
" hit '/' highlights then enter search mode
nnoremap / :set hls<Cr>/

" bring back the prev buffer, close the current one and keep the split panes
noremap <C-X> :bp\|bd #<Cr>

nnoremap Y y$
nnoremap Q @q

"" movements in insert mode
inoremap <A-j> <C-O>j
inoremap <A-k> <C-O>k
inoremap <A-l> <C-O>a
inoremap <A-h> <C-O>h
inoremap <A-w> <C-O>w
inoremap <A-e> <Esc>ea
inoremap <A-b> <C-O>b
inoremap <A-g> <Esc>gea
inoremap <A-L> <C-O>$
inoremap <A-H> <C-O>^

inoremap <C-D> <Del>

" tab for completion
inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : "\<TAB>"

vnoremap > ^o^><Esc>gv
vnoremap < 0o0<<Esc>gv

""" CUSTOM COMMANDS
:command! Vs so ~/.config/nvim/init.vim
:command! Ve e ~/.config/nvim/init.vim

"" session management
" named terminal buffer is not retained so remove them before it is saved
:command! Sm bd! default<Cr>:mksession! ~/.config/nvim/sessions/0_latest.vim
:command! Ss so ~/.config/nvim/sessions/0_latest.vim


""" TERMINAL
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


""" Python autocommands
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set foldmethod=indent |
    \ set foldlevel=99 |

""" Web Dev autocommands
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

