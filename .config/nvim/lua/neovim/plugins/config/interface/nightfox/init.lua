
-- ... init.lua

local nightfox = require("nightfox")

-- this function set the configuration of nightfox. if a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  -- change the colorscheme to use nordfox
  fox = "nightfox",
  -- disable setting the background color
  transparent = false,
  -- non current window bg to alt color see `hl-normalnc`
  alt_nc = false,
  -- configure the colors used when opening :terminal
  terminal_colors = true,
  styles = {
    -- style that is applied to comments: see `highlight-args` for options
    comments = "italic",
    -- style that is applied to functions: see `highlight-args` for options
    functions = "none",
    -- style that is applied to keywords: see `highlight-args` for options
    keywords = "none",
    -- style that is applied to strings: see `highlight-args` for options
    strings = "none",
    -- style that is applied to variables: see `highlight-args` for options
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
  -- override default colors
  colors = {
    -- override the red color for max power
    -- red = "#ff0000",
    -- bg_alt = "#000000",
  },
  -- override highlight groups
  hlgroups = {
    -- override a highlight group with the color red
    -- tspunctdelimiter = { fg = "${red}" },
    -- lspcodelens = { bg = "#000000", style = "italic" },
  },
})

-- load the configuration set above and apply the colorscheme
-- nightfox.load()

