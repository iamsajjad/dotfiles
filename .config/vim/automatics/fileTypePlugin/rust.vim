
" ... rust.vim

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal smarttab

" run current project
autocmd filetype rust nnoremap <Leader>r :w <bar> exec '!rustc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

