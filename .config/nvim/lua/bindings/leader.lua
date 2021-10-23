
-- ... leader.lua

local g = vim.g

local U = require("core.utilities")

-- map <leader> to comma
U.map("n", ",", "<Nop>")
g.mapleader = ","
g.maplocalleader = ","

