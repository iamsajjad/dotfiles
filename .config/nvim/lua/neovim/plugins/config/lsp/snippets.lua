
-- snippets.lua

local types = require("luasnip.util.types")
local Mapper = require("neovim.core.mapper")

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
Mapper.map("i", "<C-j>", function()
  require("luasnip").jump(1)
end)
Mapper.map("i", "<C-k>", function()
  require("luasnip").jump(-1)
end)
Mapper.map("s", "<C-j>", function()
  require("luasnip").jump(1)
end)
Mapper.map("s", "<C-k>", function()
  require("luasnip").jump(-1)
end)

