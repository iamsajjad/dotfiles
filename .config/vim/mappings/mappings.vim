
" ... mapping.vim

" mappingsDirectory
if isdirectory($HOME."/.config/vim/mappings/mappingsDirectory")
  for mappingsFile in split(glob($HOME."/.config/vim/mappings/mappingsDirectory/*.vim"), "\n")
    execute "source " mappingsFile
  endfor
endif

