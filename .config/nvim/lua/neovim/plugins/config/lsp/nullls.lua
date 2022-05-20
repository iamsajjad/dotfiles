
-- ... nullls.lua

local nullls = require("null-ls")
local U = require("neovim.plugins.config.lsp.utilities")

local fmt = nullls.builtins.formatting

local config = {
  sources = {
    fmt.trim_whitespace.with({
      filetypes = { "text", "sh", "zsh", "yaml", "toml", "make", "conf", "tmux" },
    }),

    -- NOTE:
    -- 1. both needs to be enabled so that `prettier` can apply `eslint` fixes
    -- 2. `prettier` should come first to prevent occasional race condition
    fmt.prettierd,
    fmt.eslint_d,
    -- fmt.prettier.with({
    --     extra_args = {
    --         '--tab-width=4',
    --         '--trailing-comma=es5',
    --         '--end-of-line=lf',
    --         '--arrow-parens=always',
    --     },
    -- }),
    fmt.rustfmt,
    -- fmt.stylua,
    fmt.terraform_fmt,
    fmt.gofmt,
    fmt.zigfmt,
  },

  -- setting up null-ls server
  on_attach = function(client, buffer)
    U.format_on_save(client, buffer)
    U.mappings(buffer)
  end,
}

-- load nullls configurations
nullls.setup(config)

