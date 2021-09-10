
" ... schemes.vim

" schemesConfig directory
if isdirectory($HOME."/.config/vim/schemes/schemesConfig")
  for configFile in split(glob($HOME."/.config/vim/schemes/schemesConfig/*.vim"), "\n")
    execute "source " configFile
  endfor
endif

