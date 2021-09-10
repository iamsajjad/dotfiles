
" ... refresh.vim

" on save reload .vimrc and do :AirlineRefresh
function! Refresh()
  if exists(':AirlineRefresh')
    AirlineRefresh
  else
    " Clear & redraw the screen, then redraw all statuslines.
    redraw!
    redrawstatus!
  endif
endfunction

