
-- ... insert.lua

local U = require("neovim.core.utilities")

-- undo chunk at a time
U.map("i", ",", ",<c-g>u")
U.map("i", ".", ".<c-g>u")
U.map("i", "!", "!<c-g>u")
U.map("i", "?", "?<c-g>u")

