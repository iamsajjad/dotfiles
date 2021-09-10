
" ... cursorConfig.vim

" cursor in any mode
set guicursor=a:blinkwait300
set guicursor+=a:blinkon200
set guicursor+=a:blinkoff150

" cursor normal mode
set guicursor+=n:block

" cursor visual mode
set guicursor+=v:ver25-iCursor

" cursor visual mode with 'selection' exclusive
set guicursor+=ve:ver25-iCursor

" cursor insert mode
set guicursor+=i:ver25-iCursor

" cursor showmatch in insert mode
set guicursor+=sm:ver25-iCursor

" cursor replace mode
set guicursor+=r:hor25-iCursor

" cursor command-line normal mode
set guicursor+=c:hor25-iCursor

" cursor command-line insert mode
set guicursor+=ci:hor25-iCursor

" cursor command-line replace mode
set guicursor+=cr:hor25-iCursor

" cursor operator-pending mode
set guicursor+=o:hor25-iCursor

" remeber cursor position
if has("autocmd")
  " enable file type detection.
  filetype plugin indent on
  " when editing a file, always jump to the last known cursor position.
  " don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
else
    " for old version of vim
    set autoindent " set vanilla autoindenting on
endif

" places to look for tags files:
set tags=./tags,tags
set tags+=tags;/

