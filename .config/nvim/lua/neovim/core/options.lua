
-- ... options.lua

local opt = vim.opt
local cmd = vim.api.nvim_command

-- cmd('syntax on')
cmd("filetype plugin indent on")

-- colors
opt.termguicolors = true
opt.background = "dark"

-- do not save when switching buffers
opt.hidden = true

-- update time
opt.timeoutlen = 500
opt.updatetime = 50

-- number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- editor interface
opt.number = true
opt.numberwidth = 6
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.laststatus = 3

-- visual vertical line or lines useful for align text
opt.colorcolumn = "+1"

-- tabs and lines
opt.expandtab = true
opt.smarttab = true
opt.cindent = true
opt.autoindent = true
opt.wrap = false
opt.textwidth = 128
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = -1 -- If negative, shiftwidth value is used
-- opt.formatoptions = 'qrn1'

-- when joining lines, don't insert two spaces after punctuation
opt.joinspaces = false

-- new vertical split right current split [vs right]
opt.splitright = true

-- new horizontal split below current split [hs below]
opt.splitbelow = true

-- unix text files format
opt.fileformat = "unix"

-- file encoding
opt.encoding = "utf-8"

-- fold
opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

-- command line
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1

-- disable mouse
opt.mouse = ""

-- transparency of floating window popup menu for completion on command line
opt.pumblend = 10

-- make long lines wrap smartly
opt.showbreak = string.rep(" ", 3)
opt.breakindent = true
opt.linebreak = true

-- bell sound
opt.belloff = "all"

-- makes neovim and host os clipboard play nicely with each other
opt.clipboard = "unnamedplus"

-- files information
opt.inccommand = "split"
opt.swapfile = false
opt.shada = { "!", "'1000", "<50", "s10", "h" }

-- change directory to opened file directory
opt.autochdir = true

-- case insensitive searching unless /c or capital in search
opt.ignorecase = true
opt.smartcase = true

-- undo and backup options
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false
opt.backupdir = "/tmp/"
opt.directory = "/tmp/"
opt.undodir = "/tmp/"

-- completion menu option
opt.completeopt = "menuone,noinsert,noselect"

-- when running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
opt.lazyredraw = true

-- format options
opt.formatoptions = opt.formatoptions
  - "a" -- disable paragraph automatic format
  - "t" -- disable wrap text using textwidth
  + "c" -- enable wrap comments using textwidth
  + "q" -- enable formatting comments w/ gq
  - "o" -- disable o and O, to insert the current comment leader
  + "r" -- enable insert comment when pressing enter
  + "n" -- enable indent past the formatlistpat, not underneath it
  + "j" -- enable remove a comment leader when joining lines
  - "2" -- disable using the indent of the second line of a paragraph for the rest

-- characters list
opt.list = true
opt.listchars = {
  -- conceal = "",
  -- eol = "",
  -- extends = "",
  -- lead = "",
  -- leadmultispace = "",
  -- multispace = "",
  -- nbsp = "",
  -- precedes = "",
  -- space = "",
  -- tab = "",
  -- trail = "",
}

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

