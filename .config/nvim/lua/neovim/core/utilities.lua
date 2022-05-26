
-- ... utilities.lua

local api = vim.api
local cmd = api.nvim_command

local U = {}

-- don't let cursor to stay on the tree
function U.move_cursor_from_tree()
  if api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
    cmd("wincmd l")
  end
end

return U

