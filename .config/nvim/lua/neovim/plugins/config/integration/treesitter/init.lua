
-- ... init.lua

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

-- path for other treesitter plugins
local path = "neovim.plugins.config.integration.treesitter" .. "."

local config = {

  -- nvim-treesitter/nvim-treesitter (self config)
  ensure_installed = "all",
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>si",
      node_incremental = "<leader>sn",
      node_decremental = "<leader>sN",
      scope_incremental = "<leader>sc",
    },
  },

  -- playground config
  playground = require(path .. "playground"),

  -- textobjects config
  textobjects = require(path .. "textobjects"),

  -- refactor config
  refactor = require(path .. "refactor"),

  -- autotag config
  autotag = require(path .. "autotag"),
}

-- load treesitter configurations
treesitter.setup(config)

