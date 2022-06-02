
-- ... commands.lua

local api = vim.api

local nvimtree = api.nvim_create_augroup("NvimTree", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = nvimtree,
  pattern = "NvimTree",
  callback = function()
    api.nvim_win_set_option(0, "wrap", false)
  end,
})

