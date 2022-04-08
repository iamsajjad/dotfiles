
-- ... compile.lua

local api = vim.api

local compile = api.nvim_create_augroup("PackerCompile", { clear = true })

-- automatically run :PackerCompile whenever `**/plugins/config.lua`
-- is updated with an autocommand
api.nvim_create_autocmd("BufWritePost", {
  group = compile,
  pattern = "**/neovim/plugins/config.lua",
  command = "source <afile> | PackerCompile",
})

