
-- ... init.lua

local lastplace = require("nvim-lastplace")

local config = {

  -- open folds
  lastplace_open_folds = true,

  -- ignore buffer types
  lastplace_ignore_buftype = {
    "help",
    "nofile",
    "quickfix",
  },

  -- ignore buffer file types
  lastplace_ignore_filetype = {
    "gitcommit",
    "gitrebase",
    "hgcommit",
    "svn",
  },
}

-- load lastplace configurations
lastplace.setup(config)

