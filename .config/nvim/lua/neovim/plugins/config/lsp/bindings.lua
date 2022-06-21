
-- ... bindings.lua

local Mapper = require("neovim.core.mapper")

-- diagnostic options
local opts = { noremap = true, silent = true, expr = false }

-- diagnostic bindings
Mapper.map("n", "<space>e", vim.diagnostic.open_float, opts)
Mapper.map("n", "[d", vim.diagnostic.goto_prev, opts)
Mapper.map("n", "]d", vim.diagnostic.goto_next, opts)
Mapper.map("n", "<space>q", vim.diagnostic.setloclist, opts)

