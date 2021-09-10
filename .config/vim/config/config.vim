
" ... config.vim

" config directory
if isdirectory($HOME."/.config/vim/config/configDirectory")
  for configFile in split(glob($HOME."/.config/vim/config/configDirectory/*.vim"), '\n')
    execute 'source ' configFile
  endfor
endif

