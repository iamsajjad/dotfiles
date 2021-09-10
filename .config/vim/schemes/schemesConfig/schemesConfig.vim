
" ... schemesConfigs.vim

" default colorscheme
silent! colorscheme blackhole

" comment highlight
highlight Comment cterm=italic gui=italic

" for more colors
if (empty($TMUX))
  " enable true color in neovim
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " set termguicolors
  if (has("termguicolors"))
    set termguicolors
  endif
endif

