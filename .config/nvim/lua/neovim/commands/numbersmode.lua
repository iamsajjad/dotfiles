
-- ... numbersmode.lua

local opt = vim.opt

local autwo = require("neovim.core.autwo")

-- use absolute numbers in insert mode
autwo.InsertEnter = function()
  opt.relativenumber = false
end

-- use relative numbers in normal mode
autwo.InsertLeave = function()
  opt.relativenumber = true
end

