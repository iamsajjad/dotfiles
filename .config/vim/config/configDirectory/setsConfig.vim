
" ... setsConfig.vim

" set terminal title
set title

" 8 bits colors
set t_Co=256

" 24 bits colors
set termguicolors

" unix text files format
set fileformat=unix

" file encoding
set encoding=utf-8

" reduce the time to show git changes and write changes to file
set updatetime=50

" break lines when line length increases
set textwidth=120

" show limit column line
set colorcolumn=121

" don't automatically wrap text when typing
set fo-=t

" don't automatically wrap on load
set nowrap

" use 4 spaces to represent tab
set tabstop=4
set softtabstop=4

" number of spaces to use for auto indent
set shiftwidth=4

" enter spaces when tab is pressed
set expandtab

" detect when a file is changed
set autoread

" change directory to opened file directory
set autochdir

" copy indent from current line when starting a new line
set autoindent

" allow cursor to be positioned one char past end of line
set selection=exclusive

" allow backgrounding buffers without writing them
set hidden

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Keep more context when scrolling off the side of a buffer
set sidescrolloff=10

" allow cursor keys to go right off end of one line, onto start of next
set whichwrap+=<,>,[,]

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show current line number
set number

" Show relative line numbers
set relativenumber

" when joining lines, don't insert two spaces after punctuation
set nojoinspaces

" make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" show search matches as the search pattern is typed
set incsearch

" search-next wraps back to start of file
set wrapscan

" highlight search words
set hlsearch

" highlight/preview substitution
if has('nvim')
  set inccommand=split
endif

" new vertical split right current split [vs right]
set splitright

" new horizontal split below current split [hs below]
set splitbelow

" do not allow spell checking
set nospell

" files that allow spell check set language to english
set spelllang=en_us

" make tab completion for files/buffers act like bash
set wildmenu

" highlight last search matches
set ruler

" highlight cursor line
set cursorline

" display number of selected chars, lines, or size of blocks.
set showcmd

" show matching brackets, etc, for 1/10th of a second
set showmatch
set matchtime=1

" apply opened file configs
set modeline

" check for file specific vim configs in the last N lines of the file
set modelines=3

" clipboard
if has('clipboard')
  set clipboard=unnamed
  if has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif

" set [dark, light] background as default
set background=dark

" syntax highlighting
syntax on

