
-- ... endspace.lua

local cmd = vim.api.nvim_command

local autwo = require("neovim.core.autwo")

-- deletes any trailing whitespace at the end of each line.
autwo.BufWritePre = function()
  cmd("%s/\\s\\+$//e")
end

