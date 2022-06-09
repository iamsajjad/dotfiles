
-- ... init.lua

local ok, hop = pcall(require, "hop")
if not ok then
  return
end

local Mapper = require("neovim.core.mapper")

-- hop configurations
local config = {}

-- load hop configurations
hop.setup(config)

-- bindings
-- hop word
Mapper.map("n", "<leader>hw", "<CMD>HopWord<CR>", { noremap = true })
Mapper.map("o", "<leader>hw", "<CMD>HopWord<CR>", { noremap = true })
Mapper.map("x", "<leader>hw", "<CMD>HopWord<CR>", { noremap = true })

-- hop line
Mapper.map("n", "<leader>hl", "<CMD>HopLine<CR>", { noremap = true })
Mapper.map("o", "<leader>hl", "<CMD>HopLine<CR>", { noremap = true })
Mapper.map("x", "<leader>hl", "<CMD>HopLine<CR>", { noremap = true })

-- hop pattern
Mapper.map("n", "<leader>hp", "<CMD>HopPattern<CR>", { noremap = true })
Mapper.map("o", "<leader>hp", "<CMD>HopPattern<CR>", { noremap = true })
Mapper.map("x", "<leader>hp", "<CMD>HopPattern<CR>", { noremap = true })

