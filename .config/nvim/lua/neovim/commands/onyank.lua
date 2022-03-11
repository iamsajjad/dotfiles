
-- ... onyank.lua

local api = vim.api
local highlight = vim.highlight

local onyank = api.nvim_create_augroup("OnYank", { clear = true })

-- highlight the region on yank
api.nvim_create_autocmd("TextYankPost", {
  group = onyank,
  callback = function()
    highlight.on_yank({ higroup = "Visual", timeout = 120 })
  end,
})

