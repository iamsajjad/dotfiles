
-- ... checktime.lua

local cmd = vim.api.nvim_command

local autwo = require("neovim.core.autwo")

-- checks for changes from outside the file
autwo.CursorHold = function()
  cmd("checktime")
end

