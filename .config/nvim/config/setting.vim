filetype plugin indent on
set scroll=15
set scrollback=100000
set scrolloff=3
set sidescrolloff=5
set signcolumn=auto
set history=1000
set hidden                          " easy to switch buffers/files with unsaved changes
set smartcase						" if pattern contains uppsecase, search is case-sensitve
" ignorecase while searching, use \C in the end to enforce case-sensitivity
" noignorecase in insert for autocompletion
set ignorecase
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase
set lazyredraw                      " lazyredraw, for macro performance
set autoread
set incsearch

set background=dark
set splitbelow splitright
set number relativenumber
set noshowmode                      " disable the redundant show mode on the last line
set noswapfile
set list                            " used to enable listchars below
set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
set nojoinspaces                    " no extra space after '.' when joining lines
set wildmode=longest,list,full      " better autocomplete in command mode
set diffopt=vertical				" git diff windows split to the side
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set fileformat=unix
set formatoptions-=tc               " disable auto wrap while typing
set formatoptions-=cro              " disable auto comment
set formatoptions+=j                " Delete comment character when joining commented lines
set completeopt=menu,noinsert		" autoselect the first entry in autocompletion
set cursorline

" undo settings
if !isdirectory($HOME."/.config/nvim/undodir")
    call mkdir($HOME."/.config/nvim/undodir", "", 0700)
endif
set undodir=~/.config/nvim/undodir
set undofile
