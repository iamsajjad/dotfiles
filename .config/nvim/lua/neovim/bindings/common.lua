
-- ... common.lua

local Mapper = require("neovim.core.mapper")

-- disable arrow keys in command mode
Mapper.map("c", "<Down>", "<Nop>")
Mapper.map("c", "<Left>", "<Nop>")
Mapper.map("c", "<Right>", "<Nop>")
Mapper.map("c", "<Up>", "<Nop>")

-- disable arrow keys in insert mode
Mapper.map("i", "<Down>", "<Nop>")
Mapper.map("i", "<Left>", "<Nop>")
Mapper.map("i", "<Right>", "<Nop>")
Mapper.map("i", "<Up>", "<Nop>")

-- disable arrow keys in normal mode
Mapper.map("n", "<Down>", "<Nop>")
Mapper.map("n", "<Left>", "<Nop>")
Mapper.map("n", "<Right>", "<Nop>")
Mapper.map("n", "<Up>", "<Nop>")

-- disable arrow keys in visual mode
Mapper.map("v", "<Down>", "<Nop>")
Mapper.map("v", "<Left>", "<Nop>")
Mapper.map("v", "<Right>", "<Nop>")
Mapper.map("v", "<Up>", "<Nop>")

