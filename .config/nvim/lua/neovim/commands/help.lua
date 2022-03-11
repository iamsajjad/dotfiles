
-- ... help.lua

local api = vim.api

local help = api.nvim_create_augroup("Help", { clear = true })

-- open help vertically and press q to exit
api.nvim_create_autocmd("BufEnter", {
  group = help,
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      api.nvim_command("wincmd L")
      api.nvim_buf_set_keymap(0, "n", "q", "<CMD>q<CR>", { noremap = true })
    end
  end,
})

