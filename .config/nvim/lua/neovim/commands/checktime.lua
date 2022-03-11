
-- ... checktime.lua

local api = vim.api

local checktime = api.nvim_create_augroup("CheckTime", { clear = true })

-- checks for changes from outside the file
api.nvim_create_autocmd("CursorHold", {
  group = checktime,
  callback = function()
    api.nvim_command("checktime")
  end,
})

