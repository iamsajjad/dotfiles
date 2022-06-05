
-- ... init.lua

local cmd = vim.cmd

local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
  return
end

local default = require("kanagawa.colors").setup()

-- this will affect all the hl-groups where the redefined colors are used
local colors = {
  -- use the palette color name...
  -- sumiInk1 = "black",
  -- fujiWhite = "#FFFFFF",
  -- ...or the theme name
  -- bg = "#272727",
  -- you can also define new colors if you want
  -- this will be accessible from require("kanagawa.colors").setup()
  -- AFTER calling require("kanagawa").setup(config)
  -- new_color = "teal"
}

local overrides = {
  -- create a new hl-group using default palette colors and/or new ones
  -- MyHlGroup1 = { fg = default.waveRed, bg = "#AAAAAA", style="underline,bold", guisp="blue" },

  -- override existing hl-groups, the new keywords are merged with existing ones
  -- VertSplit  = { fg = default.bg_dark, bg = "NONE" },
  -- TSError    = { link = "Error" },
  -- TSKeywordOperator = { style = 'bold'},
  -- StatusLine = { fg = colors.new_color }
}

-- set the kanagawa options in options table. if a value is not passed in the options table
-- it will be taken from the default configurations
local options = {
  -- enable undercurls
  undercurl = true,
  commentStyle = "italic",
  functionStyle = "NONE",
  keywordStyle = "italic",
  statementStyle = "bold",
  typeStyle = "NONE",
  variablebuiltinStyle = "italic",
  -- special highlight for the return keyword
  specialReturn = true,
  -- special highlight for exception handling keywords
  specialException = true,
  -- do not set background color
  transparent = false,
  -- dim inactive window `:h hl-NormalNC`
  dimInactive = false,
  -- adjust window separators highlight for laststatus=3
  globalStatus = true,
  colors = colors,
  overrides = overrides,
}

-- load kanagawa ( options with colors and overrides ) configurations
kanagawa.setup(options)

-- apply kanagawa colorscheme with ( options, colors, overrides )
-- configurations above
-- cmd("colorscheme kanagawa")

