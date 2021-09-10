
" ... functions.vim

" functionsDirectory
if isdirectory($HOME."/.config/vim/functions/functionsDirectory")
  for functionsFile in split(glob($HOME."/.config/vim/functions/functionsDirectory/*.vim"), "\n")
    execute "source " functionsFile
  endfor
endif

