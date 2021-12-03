
-- ... filetypes.lua

local autwo = require("neovim.core.autwo")

local events = "BufNewFile,BufRead"

autwo.group("ExtraFileTypes", {
  { events, "*.env*", "set ft=sh" },
  { events, "*.mdx", "set ft=markdown" },
  { events, "*.mjml", "set ft=html" },
  { events, "*tmux*", "set ft=tmux" },
  { events, ".eslintignore,.prettierignore,*.conf", "set ft=conf" },
  { events, ".eslintrc,.prettierrc,*.json*", "set ft=json" },
})

