
-- ... init.lua

local ok, navigator = pcall(require, "Navigator")
if not ok then
  return
end

local Mapper = require("neovim.core.mapper")

local config = {

  -- when you want to save the modified buffers when moving to tmux
  -- nil - Don't save (default)
  -- 'current' - Only save the current modified buffer
  -- 'all' - Save all the buffers
  auto_save = "current",

  -- disable navigation when tmux is zoomed in
  disable_on_zoom = false,
}

-- load navigator configurations
navigator.setup(config)

-- bindings
Mapper.map("n", "<C-h>", navigator.left)
Mapper.map("n", "<C-k>", navigator.up)
Mapper.map("n", "<C-l>", navigator.right)
Mapper.map("n", "<C-j>", navigator.down)

