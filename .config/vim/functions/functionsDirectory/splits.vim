
" ... splits.vim

function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  " switch to source and shuffle destination->source
  let markedBuf = bufnr( "%" )
  " hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  " switch to dest and shuffle destination->dest
  exe curNum . "wincmd w"
  " hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf
endfunction

