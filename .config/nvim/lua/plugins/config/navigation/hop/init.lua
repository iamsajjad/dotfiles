
-- ... init.lua

local U = require("core.utilities")

-- setup hop
require('hop').setup()

-- bindings
-- hop word
U.map("n", "<leader>hw", "<CMD>HopWord<CR>", { noremap = true })
U.map("o", "<leader>hw", "<CMD>HopWord<CR>", { noremap = true })
U.map("x", "<leader>hw", "<CMD>HopWord<CR>", { noremap = true })

-- hop line
U.map("n", "<leader>hl", "<CMD>HopLine<CR>", { noremap = true })
U.map("o", "<leader>hl", "<CMD>HopLine<CR>", { noremap = true })
U.map("x", "<leader>hl", "<CMD>HopLine<CR>", { noremap = true })

-- hop pattern
U.map("n", "<leader>hp", "<CMD>HopPattern<CR>", { noremap = true })
U.map("o", "<leader>hp", "<CMD>HopPattern<CR>", { noremap = true })
U.map("x", "<leader>hp", "<CMD>HopPattern<CR>", { noremap = true })

