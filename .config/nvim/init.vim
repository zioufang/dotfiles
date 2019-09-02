""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'yggdroot/indentline'
Plug 'vim-scripts/indentpython.vim'             " better indent for python
Plug 'godlygeek/tabular'
Plug 'szw/vim-maximizer'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'xuyuanp/nerdtree-git-plugin'
call plug#end()

colorscheme gruvbox

"" fzf
" install fd-find and ripgrep
noremap <leader>f :Files ~/projects<Cr>
noremap <leader>g :GFiles<Cr>
noremap <leader>b :Buffers<Cr>
noremap <leader>r :Rg<Cr>

"" ale
" pip install pyls
let g:ale_linters = { 'python': ['pyls']}
let g:ale_completion_enabled = 1

"" gitgutter
map <F2> :GitGutterToggle<Cr>
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0

"" nerdtree
map <F10> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^venv$[[dir]]']        " ignore folder named venv

"" indentline
" :IndentLinesToggle
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

"" sneak
let g:sneak#label = 1                           " EasyMotion behaviour

"" airline
let g:airline_section_c = 'b%n %<%F%*%m%*'      " buffer number, full path and modifier
let g:airline_section_z = 'c:%v L:%L'

"" maximizer
let g:maximizer_default_mapping_key = '<F3>'

"" jedi
"use Ctrl+N & CTRL+P to navigate completion suggestion
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#max_doc_height = 60
let g:jedi#goto_command = "<leader>pg"
let g:jedi#documentation_command = "<leader>pd"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"

"""""""""""""""""""""""""""""""""""""""""""""""""""

""" GENERAL
filetype plugin indent on
set hidden                          " easy to switch buffers/files with unsaved changes
set lazyredraw                      " lazyredraw, for macro performance
set scroll=15

""" EDITOR
set background=dark
set splitbelow splitright
set number relativenumber
set noshowmode                      " disable the redundant show mode on the last line
set list                            " used to enable listchars below
set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
set nojoinspaces                    " no extra space after '.' when joining lines
set wildignore+=.pyc |

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

" bring back the prev buffer, close the current one and keep the split panes
noremap <C-X> :bp\|bd #<Cr>

noremap <leader>vs :so ~/.config/nvim/init.vim<Cr>
noremap <leader>ve :e ~/.config/nvim/init.vim<Cr>

noremap <leader>cd :cd %:p:h<Cr>

nnoremap Y y$
nnoremap Q @q

"" movements in insert mode
inoremap <A-j> <C-O>j
inoremap <A-k> <C-O>k
inoremap <A-l> <C-O>l
inoremap <A-h> <C-O>h
inoremap <A-w> <C-O>w
inoremap <A-e> <Esc>ea
inoremap <A-b> <C-O>b
inoremap <A-g> <Esc>gea
inoremap <A-L> <C-O>$
inoremap <A-H> <C-O>^

inoremap <C-D> <Del>

inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

vnoremap <Tab>   ><Esc>gv
vnoremap <S-Tab> <<Esc>gv

"" terminal
nnoremap <F1> :split<Space><Bar><Space>term<Cr>i
tnoremap <Esc> <C-\><C-N>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>
tnoremap <C-H> <C-\><C-N><C-W><C-H>

" run paragraph in terminal below, and cursor at the next paragraph
nnoremap <leader>r yap<C-W>jpi<Cr><C-\><C-N><C-W>k]]


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

