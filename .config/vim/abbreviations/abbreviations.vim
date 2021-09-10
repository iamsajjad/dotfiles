
" ... abbreviations.vim

" abbreviations directory
if isdirectory($HOME."/.config/vim/abbreviations/abbreviationsDirectory")
  for abbreviationsFile in split(glob($HOME."/.config/vim/abbreviations/abbreviationsDirectory/*.vim"), '\n')
    execute 'source ' abbreviationsFile
  endfor
endif

