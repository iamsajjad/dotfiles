
" ... undoTreeConfig.vim

" create undoDir directory
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undoDir")
    call mkdir($HOME."/.vim/undoDir", "", 0700)
endif

set undodir=~/.vim/undoDir
set undofile

nnoremap <Leader>u :UndotreeShow<CR>

