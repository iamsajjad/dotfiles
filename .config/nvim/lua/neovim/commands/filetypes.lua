
-- ... filetypes.lua

-- disable vim-based filetype plugin
vim.g.did_load_filetypes = 0

-- enable lua-based filetype plugin
vim.g.do_filetype_lua = 1

-- custom filetypes
vim.filetype.add({
  filename = {},
  extension = {
    conf = "conf",
    eslintrc = "json",
    prettierrc = "json",
    mdx = "markdown",
  },
  pattern = {
    [".*%.env.*"] = "sh",
    [".*ignore"] = "conf",
  },
})

