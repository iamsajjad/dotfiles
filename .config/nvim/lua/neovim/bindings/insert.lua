
-- ... insert.lua

local Mapper = require("neovim.core.mapper")

-- undo chunk at a time
Mapper.map("i", ",", ",<c-g>u")
Mapper.map("i", ".", ".<c-g>u")
Mapper.map("i", "!", "!<c-g>u")
Mapper.map("i", "?", "?<c-g>u")

