
-- ... init.lua

local autopairs = require("nvim-autopairs")

-- autopairs completion setup
local completion = require("nvim-autopairs.completion.cmp")

-- autopairs configurations
local config = {}

-- load autopairs configurations
autopairs.setup(config)

-- nvim-cmp integrations
require("cmp").event:on(
  "confirm_done",
  completion.on_confirm_done({

    -- it will auto insert `(` (map_char) after select function or method item
    map_complete = true,

    -- automatically select the first item
    auto_select = true,

    -- use insert confirm behavior instead of replace
    insert = false,

    -- modifies the function or method delimiter by filetypes
    map_char = {
      all = "(",
      tex = "{",
    },
  })
)

