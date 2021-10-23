
-- ... init.lua

require("nvim-lastplace").setup({
  lastplace_open_folds = true,
  lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
  lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
})

