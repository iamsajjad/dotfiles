
-- ... visual.lua

local Mapper = require("neovim.core.mapper")

-- sore highlighted lines
Mapper.map("v", "<leader>s", ":sort<CR>")

-- substitute command
-- hit 'y' to relpace one at time or hit 'a' to confirm all replacements
Mapper.map("v", "<leader>r", '"hy:%s/<C-r>h//gc<left><left><left>', { silent = false })

-- indentation
Mapper.map("v", "<", "<gv")
Mapper.map("v", ">", ">gv")

-- move line or block of line up and down
Mapper.map("v", "J", ":move '>+1<CR>gv=gv")
Mapper.map("v", "K", ":move '<-2<CR>gv=gv")

-- delete and paste without yank
Mapper.map("v", "<leader>p", '"_dP')

