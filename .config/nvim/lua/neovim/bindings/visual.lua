
-- ... visual.lua

local U = require("neovim.core.utilities")

-- sore highlighted lines
U.map("v", "<leader>s", ":sort<CR>")

-- substitute command
-- hit 'y' to relpace one at time or hit 'a' to confirm all replacements
U.map("v", "<leader>r", '"hy:%s/<C-r>h//gc<left><left><left>', { silent = false })

-- indentation
U.map("v", "<", "<gv")
U.map("v", ">", ">gv")

-- move line or block of line up and down
U.map("v", "J", ":move '>+1<CR>gv=gv")
U.map("v", "K", ":move '<-2<CR>gv=gv")

-- delete and paste without yank
U.map("v", "<leader>p", '"_dP')

