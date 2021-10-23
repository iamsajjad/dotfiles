
-- ... init.lua

local U = require("core.utilities")

require("Navigator").setup({
  auto_save = "current",
})

-- bindings
U.map("n", "<C-h>", '<CMD>lua require("Navigator").left()<CR>')
U.map("n", "<C-k>", '<CMD>lua require("Navigator").up()<CR>')
U.map("n", "<C-l>", '<CMD>lua require("Navigator").right()<CR>')
U.map("n", "<C-j>", '<CMD>lua require("Navigator").down()<CR>')

