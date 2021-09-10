
" ... automatic.vim

" make sure highlighting works all the way down long files
autocmd BufEnter * :syntax sync fromstart

" automatically strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" toggle absolute and relative numbering by insert/normal mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" checks for changes from outside the file
autocmd CursorHold * checktime

" source .vimrc at save
augroup DOTVIMRC

  " remove autocmds from the group
  " automatic reload .vimrc and run Refresh
  autocmd! BufWritePost .vimrc source $MYVIMRC | :call Refresh()

augroup end

