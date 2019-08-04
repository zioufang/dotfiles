" https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/
" http://vimdoc.sourceforge.net/htmldoc/options.html
" install vim-X11 in Fedora or vim-gnome in Debian for system clipboard support

"""""""""""""""""""""""""""""""""""""""""""""""""""
"" GENERAL SETTING
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set t_Co=256
set autoread                    " set to auto read when a file is changed from outside
set hidden                      " hide buffer, easy to switch files with unsaved changes
set history=100
set undolevels=100

set fileencoding=utf-8
set confirm                     " confirm :q in case of unsaved changes
set nobackup                    " don't keep backup
set noswapfile
set lazyredraw                  " don't redraw while executing macros (for performance)

syntax on
filetype on
filetype plugin on
filetype indent on

set noerrorbells                " don't beep
set novisualbell                " don't beep

set wildignore+=.pyc            " ignore files when opening based on glob pattern



"""""""""""""""""""""""""""""""""""""""""""""""""""
"" DISPLAY SETTING
"""""""""""""""""""""""""""""""""""""""""""""""""""
try
    colorscheme desert
catch
endtry

set encoding=utf-8
set background=dark
set number
set ruler                       " show cursor position
set showmatch                   " highlight maching braces
set noshowmode                    " show insert/replace/visual mode

set nofoldenable                "disable code folding by default
set foldmethod=indent
set foldnestmax=3

set list                        " turns on display for unprintable char
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " show trailing white spaces

set scrolloff=3                 " lines above/below the cursor while scrolling
set sidescrolloff=5
set laststatus=2                " alwasy show tatus line
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}



"""""""""""""""""""""""""""""""""""""""""""""""""""
"" EDIT SETTING
"""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=100
set backspace=indent,eol,start  " backspace fixes
set nojoinspaces                " no extra space after '.' when joining lines

" tabs & indents
set expandtab                   " fill tab with spaces
set tabstop=4                   " set tab to 4
set softtabstop=4               " tab size when inserting/pasting
set shiftwidth=4                " set indentation to 4 for autoindent
set shiftround                  " When shifting lines, round to the nearest multiple of shiftwidth
set smarttab                    " insert tabs using shiftwidth instead of tabstop
set autoindent


" search setting
set hlsearch                    " highlight search results
set incsearch                   " do incremental search
set ignorecase                  " ignore case
set smartcase                   " ...unless capital letters are used



"""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEY MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-t> :NERDTreeToggle<CR>
nnoremap <Tab><Tab> :vsplit<CR>       " split current file to a new window
nnoremap <F2> :exec &mouse!=""? "set mouse=" : "set mouse=a"<CR>
nnoremap <F3> :set invwrap wrap?<CR>  " toggle word wrap
nnoremap <F4> :set invhls hls?<CR>    " toggle search highlight
noremap <C-h> <C-W>h                  " moving to the left window
noremap <C-l> <C-W>l                  " moving to the right window      
                
" indent/dedent what just pasted
nnoremap <leader>< V`]<
nnoremap <leader>> V`]>

" capitalize first letter of each word
nnoremap <leader>,t :silent s/\<\(\w\)\(\S*\)/\u\1\L\2/g<cr>

map <C-c> "*y                         " copy to system clipboard (use register *)
nnoremap cp yap<S-}>p                 " copy the current paragraph 

inoremap {<cr> {<cr>}<ESC>kA<CR><Tab>      " Automatically add closing

" allow saving a sudo file if forgot to open as sudo
cmap w!! w !sudo tee % >/dev/null
