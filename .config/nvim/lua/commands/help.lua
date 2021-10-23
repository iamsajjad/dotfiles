
-- ... help.lua

local api = vim.api
local cmd = api.nvim_command

local autwo = require("core.autwo")

-- open help vertically and press q to exit
autwo.BufEnter = {
  "*.txt",
  function()
    if vim.bo.buftype == "help" then
      cmd("wincmd L")
      local handle = api.nvim_get_current_buf()
      api.nvim_buf_set_keymap(handle, "n", "q", ":q<CR>", { noremap = true, silent = true })
    end
  end,
}

