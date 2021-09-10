
" ... configure.vim

if isdirectory($HOME."/.config/vim/plugins")
  " source plugins configurations from pluginsConfig directory
  if isdirectory($HOME."/.config/vim/plugins/pluginsConfig")
    for configDirectory in split(glob($HOME."/.config/vim/plugins/pluginsConfig/*"), "\n")
      if isdirectory(configDirectory)
        for configFile in split(glob(configDirectory."/*.vim"), "\n")
          execute "source " configFile
        endfor
      endif
    endfor
  endif
endif

