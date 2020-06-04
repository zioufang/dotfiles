let g:indentLine_enabled = 0
au BufNewFile,BufRead *.yaml,*.yml,*.j2 let g:indentLine_enabled = 1
nmap <F7> :IndentlinesToggle<Cr>
