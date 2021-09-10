
" ... nModeMappings.vim

" taggle between background dark and light
map <Leader>. :call ToggleBackground()<CR>

" taggle between split files
nnoremap <tab> <C-w>w

" taggle between splits files using h, j, k, l
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-l> <c-w>l

" resize split files using h, j, k, l
nnoremap <A-k> :resize -5<CR>
nnoremap <A-j> :resize +5<CR>
nnoremap <A-h> :vertical resize -5<CR>
nnoremap <A-l> :vertical resize +5<CR>

" reset splits size
nnoremap <A-e> :wincmd =<CR>
" maximize current split
nnoremap <A-m> <C-w><bar> <C-w>_

" swip split files using h, j, k, l
nnoremap <S-k> :call MarkWindowSwap()<CR> <C-w>k :call DoWindowSwap()<CR>
nnoremap <S-h> :call MarkWindowSwap()<CR> <C-w>h :call DoWindowSwap()<CR>
nnoremap <S-j> :call MarkWindowSwap()<CR> <C-w>j :call DoWindowSwap()<CR>
nnoremap <S-l> :call MarkWindowSwap()<CR> <C-w>l :call DoWindowSwap()<CR>

" tabs mapping
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnext<Space>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

" fold mapping
nnoremap <Leader>ff :set foldmethod=manual<CR>
nnoremap <Leader>fi :set foldmethod=indent<CR>
nnoremap <Leader>fm :set foldmethod=marker<CR>
nnoremap <Leader>fs :set foldmethod=syntax<CR>
nnoremap <Leader>fd :set foldmethod=diff<CR>

" drop a mark before jumping to the top or bottom of the file
nnoremap gg mjgg
nnoremap G mjG

" keep cursor in center
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" move line up and down
nnoremap <Leader>k :move .-2<CR>==
nnoremap <Leader>j :move .+1<CR>==

" open TODO file
nnoremap <Leader>t :tabedit ~/TODO<CR>

" duplicate current line >>> 'yy' >>> 'p'
nmap <C-d> mzyyp`z

" map key to dismiss search highlighted ness
map <BS> :nohlsearch<CR>

