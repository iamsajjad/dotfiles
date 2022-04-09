
-- ... init.lua

local colorizer = require("colorizer")

local config = {

  --[[

  -- default options can be replace with file type
  DEFAULT_OPTIONS = {

    -- #RGB hex codes
    RGB = true,

    -- #RRGGBB hex codes
    RRGGBB = true,

    -- "Name" codes like Blue
    names = true,

    -- #RRGGBBAA hex codes
    RRGGBBAA = false,

    -- CSS rgb() and rgba() functions
    rgb_fn = false,

    -- CSS hsl() and hsla() functions
    hsl_fn = false,

    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css = false,

    -- Enable all CSS *functions*: rgb_fn, hsl_fn
    css_fn = false,

    -- Available modes: foreground, background
    -- Set the display mode.
    mode = "background",
  },

  --]]
}

-- load colorizer configurations
colorizer.setup(config)

