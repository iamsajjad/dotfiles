
" ... vModeMappings.vim

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" substitute command
" hit 'y' to relpace one at time or hit 'a' to confirm all replacements
vnoremap <Leader>r "hy:%s/<C-r>h//gc<Left><Left><Left>

" indentation
vnoremap < <gv
vnoremap > >gv

" move line or block of line up and down
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" delete and paste without yank
vnoremap <Leader>p "_dP

