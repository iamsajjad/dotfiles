
-- ... endspace.lua

local api = vim.api

local endspace = api.nvim_create_augroup("EndSpace", { clear = true })

-- deletes any trailing whitespace at the end of each line.
api.nvim_create_autocmd("BufWritePre", {
  group = endspace,
  callback = function()
    api.nvim_command("%s/\\s\\+$//e")
  end,
})

