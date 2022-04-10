
-- ... init.lua

local devicons = require("nvim-web-devicons")

local config = {

  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- devicon will be appended to `name`
  override = {
    -- devicon for zsh files
    -- zsh = {
    --   icon = "",
    --   color = "#428850",
    --   cterm_color = "65",
    --   name = "Zsh"
    -- },
  },

  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}

-- load colorizer configurations
devicons.setup(config)

