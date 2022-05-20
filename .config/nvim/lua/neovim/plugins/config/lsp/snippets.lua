
-- snippets.lua

local types = require("luasnip.util.types")
local U = require("neovim.core.utilities")

local snippets = require("luasnip.config")

local config = {
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {
          { "●", "DiffAdd" },
        },
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = {
          { "●", "DiffDelete" },
        },
      },
    },
  },
}

-- load snippets configurations
snippets.setup(config)

-- loading any vscode snippets from plugins
require("luasnip.loaders.from_vscode").lazy_load()

-- key bindings to move around inside snippets
U.map("i", "<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
U.map("i", "<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')
U.map("s", "<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
U.map("s", "<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')

