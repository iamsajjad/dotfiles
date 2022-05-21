
-- ... mapper.lua

local keymap = vim.keymap

local Mapper = {}

-- main key map method
Mapper.map = function(mode, key, result, options)
  -- default options for ( noremap, silent, expr )
  local default = { noremap = true, silent = true, expr = false }

  if options then
    options = vim.tbl_extend("keep", options, default)
  end

  -- set key map with ( mode, key, result, options )
  keymap.set(mode, key, result, options)
end

return Mapper

