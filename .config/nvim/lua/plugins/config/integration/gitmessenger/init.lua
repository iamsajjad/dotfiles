
-- ... init.lua

local U = require("core.utilities")
local g = vim.g

g.git_messenger_no_default_mappings = true

-- bindings
U.map("n", "gm", ":GitMessenger<CR>")

