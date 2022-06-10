
-- ... init.lua

local ok, neoscroll = pcall(require, "neoscroll")
if not ok then
  return
end

local config = {

  -- all these keys will be mapped to their corresponding default scrolling animation
  mappings = {
    "<C-u>",
    "<C-d>",
    "<C-b>",
    "<C-f>",
    "<C-y>",
    "<C-e>",
    "zt",
    "zz",
    "zb",
  },

  -- hide cursor while scrolling
  hide_cursor = false,

  -- stop at <EOF> when scrolling downwards
  stop_eof = true,

  -- use the local scope of scrolloff instead of the global scope
  use_local_scrolloff = false,

  -- stop scrolling when the cursor reaches the scrolloff margin of the file
  respect_scrolloff = false,

  -- the cursor will keep on scrolling even if the window cannot scroll further
  cursor_scrolls_alone = true,

  -- default easing function
  easing_function = nil,

  -- function to run before the scrolling animation starts
  pre_hook = nil,

  -- function to run after the scrolling animation ends
  post_hook = nil,

  -- disable "performance mode" on all buffers.
  performance_mode = false,
}

-- load neoscroll configurations
neoscroll.setup(config)

