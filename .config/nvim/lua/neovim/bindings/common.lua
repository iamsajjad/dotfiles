
-- ... common.lua

local U = require("neovim.core.utilities")

-- disable arrow keys in command mode
U.map("c", "<Down>", "<Nop>")
U.map("c", "<Left>", "<Nop>")
U.map("c", "<Right>", "<Nop>")
U.map("c", "<Up>", "<Nop>")

-- disable arrow keys in insert mode
U.map("i", "<Down>", "<Nop>")
U.map("i", "<Left>", "<Nop>")
U.map("i", "<Right>", "<Nop>")
U.map("i", "<Up>", "<Nop>")

-- disable arrow keys in normal mode
U.map("n", "<Down>", "<Nop>")
U.map("n", "<Left>", "<Nop>")
U.map("n", "<Right>", "<Nop>")
U.map("n", "<Up>", "<Nop>")

-- disable arrow keys in visual mode
U.map("v", "<Down>", "<Nop>")
U.map("v", "<Left>", "<Nop>")
U.map("v", "<Right>", "<Nop>")
U.map("v", "<Up>", "<Nop>")

