
-- ... init.lua

local indentline = require("indent_blankline")

local config = {

  -- char = "│",

  -- space_char_blankline = " ",

  show_first_indent_level = false,

  -- show_trailing_blankline_indent = false,

  -- file type exclude
  filetype_exclude = {
    "help",
    "packer",
    "FTerm",
  },

  -- buffer type exclude
  buftype_exclude = {
    "terminal",
    "nofile",
  },

  --[[

  -- character highlight
  char_highlight_list = {

    -- name of highlight group number one
    "",

    -- name of highlight group number two
    "",
  },

  -- space between characters highlight
  space_char_highlight_list = {

    -- name of highlight group number one
    "",

    -- name of highlight group number two
    "",
  },

  --]]
}

-- load indentline configurations
indentline.setup(config)

