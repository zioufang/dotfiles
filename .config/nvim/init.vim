"" Leaders
" q   : :q<Cr>
" f   : FZF Files
" g   : FZF GFiles
" r   : FZF Rg
" b   : FZF Buffers
" s   : Slime Send Paragraph/Region to Repl
" l   : SLime send current line to Repl
" i   : IF 'python' Toggle ipython3 Terminal
"     : IF 'go' then go-run
" y   : Yank to system clipboard
" p   : Paste from system clipboard
" w   : Quick Save
" q   : Quick quite
" cd  : cd to current directory
" t   : Toggle 'default' terminal
" d   : 'blackhold' delete
" v   : vsplit
" u   : undo
" o   : DogeGenerate
" h   : GitGutter Ops

"" F# Keys
" F3  : Toggle search highlight
" F6  : MarkdownPreview
" F7  : Toggle Indentline
" F12 : Toggle Maximize current window

""
" gd  : Coc go to definition vsplit
" K   : Coc show documentation
" ]l  : Coc next lint warning/error
" [l  : Coc prev lint warning/error

""" PLUGIN
""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'sainnhe/gruvbox-material'
Plug 'vifm/vifm.vim'
Plug 'unblevable/quick-scope'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-vinegar'						" better newrw
Plug 'tpope/vim-abolish'                        " for its coersion
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'jpalardy/vim-slime'						" REQUIRES nevim > 0.3
Plug 'psf/black', { 'for': 'python', 'tag': '19.10b0' }           " To make sure pip and vim has the same black version: pip install --upgrade git+https://github.com/psf/black.git
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" non essential
Plug 'kkoomen/vim-doge'							" documentation generator
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'                       " blame, Gbrowse & Gdiffsplit
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'szw/vim-maximizer'
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'

call plug#end()

""" LEADERS
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>d "_d
noremap <leader>q :q<Cr>
noremap <leader>w :w<Cr>
noremap <leader>cd :cd %:p:h<Cr>
noremap <leader>v <C-W><C-V>
noremap <leader>u :undo<Cr>

""" KEY MAPPINGS
map <Space> <leader>

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

nnoremap S :%s///gc<Left><Left><Left><Left>
nnoremap Y y$
nnoremap Q @q
nnoremap gh ^
nnoremap gl $

" insert blank line, :set paste to disable auto indent
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"" movements in insert mode
inoremap <C-D> <Del>

" tab for completion
" better implementation in coc
" inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : "\<TAB>"

vnoremap > ^o^><Esc>gv
vnoremap < 0o0<<Esc>gv

:command! Vs so ~/.config/nvim/init.vim
:command! Ve e ~/.config/nvim/init.vim


"" nvim configs
source $HOME/.config/nvim/config/setting.vim
source $HOME/.config/nvim/config/terminal.vim
source $HOME/.config/nvim/config/autocmd.vim

"" plugin configs
source $HOME/.config/nvim/plugin_config/vifm.vim
source $HOME/.config/nvim/plugin_config/coc.vim
source $HOME/.config/nvim/plugin_config/fzf.vim
source $HOME/.config/nvim/plugin_config/quick-scope.vim
source $HOME/.config/nvim/plugin_config/ale.vim
source $HOME/.config/nvim/plugin_config/gitgutter.vim
source $HOME/.config/nvim/plugin_config/slime.vim
source $HOME/.config/nvim/plugin_config/sneak.vim
source $HOME/.config/nvim/plugin_config/terraform.vim
source $HOME/.config/nvim/plugin_config/markdown-preview.vim
source $HOME/.config/nvim/plugin_config/doge.vim
source $HOME/.config/nvim/plugin_config/lightline.vim
source $HOME/.config/nvim/plugin_config/indentline.vim
source $HOME/.config/nvim/plugin_config/maximizer.vim

" true color
set termguicolors
" run colorscheme last for quick-scope
colorscheme gruvbox-material
