
-- ... nullls.lua

local nls = require("null-ls")
local U = require("neovim.plugins.config.lsp.utilities")

local fmt = nls.builtins.formatting

-- configuring null-ls
nls.setup({
  sources = {
    fmt.trim_whitespace.with({
      filetypes = { "text", "sh", "zsh", "yaml", "toml", "make", "conf", "tmux" },
    }),
    -- NOTE:
    -- 1. both needs to be enabled to so prettier can apply eslint fixes
    -- 2. and prettierd should come first
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
  on_attach = function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end,
})

