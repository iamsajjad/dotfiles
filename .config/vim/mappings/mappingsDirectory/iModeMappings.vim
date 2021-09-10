
" ... iModeMappings.vim

" move line up and down
inoremap <silent> <C-j> <Esc>:move .+1<CR>==gi
inoremap <silent> <C-k> <Esc>:move .-2<CR>==gi

" undo chunk at a time
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

