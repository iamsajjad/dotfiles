
-- ... numbersmode.lua

local api = vim.api
local opt = vim.opt

local numbersmode = api.nvim_create_augroup("NumbersMode", { clear = true })

-- use absolute numbers in insert mode
api.nvim_create_autocmd("InsertEnter", {
  group = numbersmode,
  callback = function()
    opt.relativenumber = false
  end,
})

-- use relative numbers in normal mode
api.nvim_create_autocmd("InsertLeave", {
  group = numbersmode,
  callback = function()
    opt.relativenumber = true
  end,
})

