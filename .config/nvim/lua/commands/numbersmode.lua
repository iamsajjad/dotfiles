
-- ... numbersmode.lua

local opt = vim.opt

local autwo = require("core.autwo")

-- use absolute numbers in insert mode
autwo.InsertEnter = function()
  vim.opt.relativenumber = false
end

-- use relative numbers in normal mode
autwo.InsertLeave = function()
  vim.opt.relativenumber = true
end

