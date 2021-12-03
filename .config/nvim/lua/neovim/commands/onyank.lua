
-- ... onyank.lua

local highlight = vim.highlight

local autwo = require("neovim.core.autwo")

autwo.TextYankPost = function()
  highlight.on_yank({ higroup = "Visual", timeout = 120 })
end

