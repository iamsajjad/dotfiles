
-- ... utilities.lua

local api = vim.api
local cmd = api.nvim_command

local U = {}

-- key mapping
function U.map(mode, key, result, opts)
  local options = { noremap = true, silent = true, expr = false }

  if opts then
    options = vim.tbl_extend("keep", opts, options)
  end

  api.nvim_set_keymap(mode, key, result, options)
end

-- don't let cursor to stay on the tree
function U.move_cursor_from_tree()
  if api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
    cmd("wincmd l")
  end
end

return U

