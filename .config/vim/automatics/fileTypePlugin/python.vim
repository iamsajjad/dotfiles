
" ... python.vim

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal smarttab

" run current file
nnoremap <Leader>r :w <bar> exec '!python '.shellescape('%')<CR>

