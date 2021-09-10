
" ... indentLineConfig.vim

" indent character color based on background
if &background ==# 'dark'
  let g:indentLine_color_term = 236
  let g:indentLine_color_gui = '#303030'
else
  let g:indentLine_color_term = 252
  let g:indentLine_color_gui = '#cfcfcf'
endif

" indent character
let g:indentLine_char = '.'

" or use for each indent level a distinct character
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']

