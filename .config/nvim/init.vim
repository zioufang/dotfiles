" Leaders
" b   : FZF Buffers
" <s> : FZF GFiles
" /   : FZF BLines
" ?   : CocSearchCustom with cword
" y   : Yank to system clipboard
" p   : Paste from system clipboard
" w   : Quick Save
" cd  : cd to current directory
" t   : Toggle 'default' terminal
" s   : global replace shortcut
" d   : 'blackhold' delete
" o   : DogeGenerate

"" fugitive
" gs  : :G

"" Coc
" gd  : go to definition
" gr  : go to reference
" K   : show doc

"" ALE
" ]l  : Coc next lint warning/error
" [l  : Coc prev lint warning/error

" language specific
" go
" lt  : generate test for selected function with gotests
" py
" lr  : ipython3 repl

"" F# Keys
" F3  : Toggle search highlight
" F4  : Toggle breakpoint in debugger
" F5  : ALE Toggle
" F6  : MarkdownPreview
" F7  : Toggle Indentline
" F12 : Toggle Maximize current window

""
" ZZ  : changed to :q without !

"" abolish coersion
" snake_case (crs)
" MixedCase (crm)
" camelCase (crc)
" snake_case (crs)
" UPPER_CASE (cru)
" dash-case (cr-)
" dot.case (cr.)
" space case (cr<space>)
" Title Case (crt)

""" KEY MAPPINGS
map <Space> <leader>
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>d "_d
noremap <leader>w :update<Cr>
noremap <leader>cd :cd %:p:h<Cr>
nnoremap <leader>s :%s///gc<Left><Left><Left><Left>
" nnoremap <leader>b :buffers<CR>:b
" cabbrev bv vert sb

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
nnoremap gh ^
nnoremap gl $
" c to blackhole
nnoremap c "_c
nnoremap C "_C
nnoremap <silent>ZZ :q<Cr>

" insert blank line, :set paste to disable auto indent
nnoremap <silent><A-o> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-O> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"" movements in insert mode
inoremap <C-D> <Del>
inoremap {{ {<Cr>}<Esc>O
inoremap {} {}<Left>

" tab for completion
" better implementation in coc
" inoremap <expr><TAB>  pumvisible() ? "\<C-y>" : "\<TAB>"

vnoremap > ^o^><Esc>gv
vnoremap < 0o0<<Esc>gv


:command! Vs so ~/.config/nvim/init.vim
:command! Ve e ~/.config/nvim/init.vim

" delete all buffers except the current
" delete all buffers -> edit the last buffer -> delete the [No Name] buffer
:command! BufOnly silent! execute ":%bd|e#|bd#"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

"" nvim configs
call s:SourceConfigFilesIn('config')

"" plugin configs
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'                       " blame, Gbrowse & Gdiffsplit
Plug 'tpope/vim-commentary'
Plug 'zioufang/vim-sneak'
Plug 'sainnhe/gruvbox-material'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-vinegar'						" better newrw
Plug 'tpope/vim-abolish'                        " for its coersion
Plug 'dense-analysis/ale'
" Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" non essential
Plug 'vifm/vifm.vim'
Plug 'unblevable/quick-scope'
Plug 'stefandtw/quickfix-reflector.vim'         " modify quickfix, together with FzfRg for refactoring
Plug 'kkoomen/vim-doge'							" documentation generator
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'szw/vim-maximizer'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
" Plug 'jpalardy/vim-slime', {'for': 'python'}	" only used for python for now

call plug#end()

call s:SourceConfigFilesIn('plugin_config')

" true color
if has('termguicolors')
    set termguicolors
endif
" run colorscheme last for quick-scope
" gruvbox material settings
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
" Custom color needs to be placed after the colorscheme
" https://jonasjacek.github.io/colors/
highlight CursorLine ctermbg=240 guibg=#3a3a3a
autocmd InsertEnter * highlight CursorLine ctermbg=235 guibg=#282828
autocmd InsertLeave * highlight CursorLine ctermbg=237 guibg=#3a3a3a
augroup NoCursorLine
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END



"""
""" SHARED FUNCTIONS
"""
" autoformatter that remembers cursor position and autosave the formatted output
" it does not runs autoformat if there is syntax error (otherwise it will
" replace the file with the error output)
" it usually used in conjunction with BufWritePost (not BufWrite due to error
" checking)
" Assumptions:
" 1. it assumes the formatter will return non-zero shell_error if there is syntax
" error and zero shell_error if there is not (e.g. black --check doesn't work here
" because it returns 1 if there is a format change)
" 2. it assumes the formatter will output the formatted code to stdout (e.g.
" black doesn't work because it replacs the files)
function! CodeFormat(formatter)
    let l:current_pos = getpos('.')
    silent exec '! ' . a:formatter . ' %'
    if v:shell_error
        echom "Can't format due to syntax error"
    else
        silent exec '%! ' . a:formatter
        echom "Autoformatted"
        silent exec "w"
    endif
    call setpos('.', l:current_pos)
endfunction
