
" ... airLineConfig.vim

" airline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" airline fonts
let g:airline_powerline_fonts = 1

" airline theme
let g:airline_theme='blackhole'

" enable/disable searchcount integration
let g:airline#extensions#searchcount#enabled = 1

" airline tabline
let g:airline#extensions#tabline#enabled = 1

" configure separators for the tabline only
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" defines the name of a formatter for how buffer names are displayed
let g:airline#extensions#tabline#formatter = 'default'

" enable/disable displaying number of tabs in the right side
let g:airline#extensions#tabline#show_tab_count = 1

" rename label for buffers (default: 'buffers')
let g:airline#extensions#tabline#buffers_label = ':: Buffers'

" rename label for tabs (default: 'tabs')
let g:airline#extensions#tabline#tabs_label = ':: tabs ::'

" configure whether close button should be shown
let g:airline#extensions#tabline#show_close_button = 0

" configure symbol used to represent close button
let g:airline#extensions#tabline#close_symbol = ''

" enable/disable displaying number of tabs in the right side
let g:airline#extensions#tabline#show_tab_count = 1

" enable/disable displaying tabs, regardless of number
let g:airline#extensions#tabline#show_tabs = 1

" configure how numbers are displayed in tab mode
let g:airline#extensions#tabline#tab_nr_type = 2

