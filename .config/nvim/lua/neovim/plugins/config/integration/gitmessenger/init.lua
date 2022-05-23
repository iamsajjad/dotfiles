
-- ... init.lua

local Mapper = require("neovim.core.mapper")
local g = vim.g

g.git_messenger_no_default_mappings = true

-- bindings
Mapper.map("n", "gm", ":GitMessenger<CR>")

