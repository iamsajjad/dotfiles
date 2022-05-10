
-- ... init.lua

local cmd = vim.cmd
local nightfox = require("nightfox")

-- set the nightfox options in options table. if a value is not passed in the options table
-- it will be taken from the default configurations
local options = {
  -- compiled file's destination location
  -- compile_path = utilities.join_paths(vim.fn.stdpath("cache"), "nightfox"),
  -- compiled file suffix
  compile_file_suffix = "_compiled",
  -- disable setting background
  transparent = false,
  -- set terminal colors (vim.g.terminal_color_*)
  terminal_colors = true,
  -- non focused panes set to alternative background
  dim_inactive = false,
  -- styles config
  styles = {
    -- style that is applied to comments
    comments = "italic",
    -- style that is applied to functions
    functions = "none",
    -- style that is applied to keywords
    keywords = "none",
    -- style that is applied to numbers
    numbers = "none",
    -- style that is applied to strings
    strings = "none",
    -- style that is applied to types
    types = "none",
    -- style that is applied to variables
    variables = "none",
  },
  inverse = {
    -- enable/disable inverse highlighting for match parens
    match_paren = false,
    -- enable/disable inverse highlighting for visual selection
    visual = false,
    -- enable/disable inverse highlights for search highlights
    search = false,
  },
  -- list of various plugins and additional options
  modules = {},
}

-- palettes are the base color defines of a colorscheme.
-- you can override these palettes for each colorscheme defined by nightfox
local palettes = {
  nightfox = {
    -- each palette defines these colors:
    --   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
    --
    -- these colors have 3 shades: base, bright, and dim
    --
    -- defining just a color defines it's base color
    -- red = "#c94f6d",

    -- defining multiple shades is done by passing a table
    -- blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d", }

    -- a palette also defines the following:
    --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
    --
    -- these are the different foreground and background shades used by the theme.
    -- the base bg and fg is 1, 0 is normally the dark alternative. the others are
    -- incrementally lighter versions.
    -- bg1 = "#2e3440",

    -- sel is different types of selection colors.
    -- sel0 = "#3e4a5b", -- popup bg, visual selection bg
    -- sel1 = "#4f6074", -- popup sel bg, search bg

    -- comment is the definition of the comment color.
    -- comment = "#60728a",
  },
  dayfox = {
    -- palettes config for dayfox
  },
  dawnfox = {
    -- palettes config for dawnfox
  },
  duskfox = {
    -- palettes config for duskfox
  },
  nordfox = {
    -- palettes config for nordfox
  },
  terafox = {
    -- palettes config for terafox
  },
}

-- spec's (specifications) are a mapping of palettes to logical groups that will be
-- used by the groups. some examples of the groups that specs map would be:
--   - syntax groups (functions, types, keywords, ...)
--   - diagnostic groups (error, warning, info, hints)
--   - git groups (add, removed, changed)

-- you can override these just like palettes
local specs = {
  nightfox = {
    syntax = {
      -- specs allow you to define a value using either a color or template. if the string does
      -- start with `#` the string will be used as the path of the palette table. defining just
      -- a color uses the base version of that color.
      -- keyword = "magenta",

      -- adding either `.bright` or `.dim` will change the value
      -- conditional = "magenta.bright",
      -- number = "orange.dim",
    },
    git = {
      -- a color define can also be used
      -- changed = "#f4a261",
    },
  },
}

-- groups are the highlight group definitions. the keys of this table are the name of the highlight
-- groups that will be overridden. the value is a table with the following values:
--   - fg, bg, style, sp, link,
--
-- just like `spec` groups support templates. this time the template is based on a spec object.
local groups = {
  -- by default nightfox links some groups together. `cursorline` is one of these groups. when overriding
  -- make sure `link` is cleared to `""` so that the link will be removed.
  -- cursorline = { bg = "sel0", link = "" },

  -- specs are used for the template. specs have their palette's as a field that can be accessed
  -- incsearch = { bg = "palette.cyan" },
}

-- load nightfox ( options, palettes, specs, groups ) configurations
nightfox.setup({ options = options, palettes = palettes, specs = specs, groups = groups })

-- apply one of nightfox colorscheme ( nightfox, dayfox, dawnfox, duskfox, nordfox, terafox )
-- with ( options, palettes, specs, groups ) configurations above
-- cmd("colorscheme duskfox")

