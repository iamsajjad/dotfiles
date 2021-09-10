
" ... registers.vim

" set registers to empty
function! EmptyRegisters()
  let registers=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for register in registers
    call setreg(register, [])
  endfor
endfunction

