
" ... .vimrc

" configure vim / neovim with .config/vim directory
if isdirectory($HOME."/.config/vim")
  " config files
  source $HOME/.config/vim/config/config.vim
  " plugins files
  call plug#begin("~/.vim/plugged")

    " source plugins files
    " bundles.vim, formats.vim, languages.vim, schemes.vim, syntaxes.vim
    if isdirectory($HOME."/.config/vim/plugins")
      for pluginsFile in split(glob($HOME."/.config/vim/plugins/*.vim"), "\n")
        execute "source " pluginsFile
      endfor
    endif

    " for test or temporary adding plugin do
    " Plug 'organization/repository'

  call plug#end()
  " abbreviations files
  source $HOME/.config/vim/abbreviations/abbreviations.vim
  " automatic files
  source $HOME/.config/vim/automatics/automatics.vim
  " functions files
  source $HOME/.config/vim/functions/functions.vim
  " mappings files
  source $HOME/.config/vim/mappings/mappings.vim
  " schemes files
  source $HOME/.config/vim/schemes/schemes.vim
  " snippets files
  source $HOME/.config/vim/snippets/snippets.vim
  " configure file handle plugins config
  source $HOME/.config/vim/configure.vim
endif

