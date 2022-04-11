
-- ... init.lua

local U = require("neovim.core.utilities")

local navigator = require("Navigator")

local config = {

  -- when you want to save the modified buffers when moving to tmux
  -- nil - Don't save (default)
  -- 'current' - Only save the current modified buffer
  -- 'all' - Save all the buffers
  auto_save = "current",

  -- disable navigation when tmux is zoomed in
  disable_on_zoom = false,
}

-- bindings
U.map("n", "<C-h>", '<CMD>lua require("Navigator").left()<CR>')
U.map("n", "<C-k>", '<CMD>lua require("Navigator").up()<CR>')
U.map("n", "<C-l>", '<CMD>lua require("Navigator").right()<CR>')
U.map("n", "<C-j>", '<CMD>lua require("Navigator").down()<CR>')

-- load navigator configurations
navigator.setup(config)

