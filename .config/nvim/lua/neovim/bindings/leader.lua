
-- ... leader.lua

local g = vim.g

local Mapper = require("neovim.core.mapper")

-- map <leader> to comma
Mapper.map("n", ",", "<Nop>")
g.mapleader = ","
g.maplocalleader = ","

