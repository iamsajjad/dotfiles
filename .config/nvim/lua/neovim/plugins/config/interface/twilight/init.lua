
-- ... init.lua

local ok, twilight = pcall(require, "twilight")
if not ok then
  return
end

local config = {
  dimming = {

    -- amount of dimming
    alpha = 0.25,

    -- we try to get the foreground from the highlight groups or fallback color
    color = { "Normal", "#ffffff" },

    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    inactive = false,
  },

  -- amount of lines we will try to show around the current line
  context = 10,

  -- use treesitter when available for the filetype
  treesitter = true,

  -- treesitter is used to automatically expand the visible text,
  -- but you can further control the types of nodes that should always be fully expanded
  -- for treesitter, we we always try to expand to the top-most ancestor with these types
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },

  -- exclude these filetypes
  exclude = {},
}

-- load twilight configurations
twilight.setup(config)

