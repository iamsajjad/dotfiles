
-- ... init.lua

local gitsigns = require("gitsigns")

local config = {

  -- add, change, delete, topdelete and changedelete
  -- characters and colors
  signs = {
    add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "=", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },

  -- toggle with `:Gitsigns toggle_signs`
  signcolumn = true,

  -- toggle with `:Gitsigns toggle_numhl`
  numhl = false,

  -- toggle with `:Gitsigns toggle_linehl`
  linehl = false,

  -- toggle with `:Gitsigns toggle_word_diff`
  word_diff = false,

  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },

  attach_to_untracked = true,

  -- toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,

    -- 'eol' | 'overlay' | 'right_align'
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },

  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  sign_priority = 6,
  update_debounce = 100,

  -- use default
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {

    -- options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

-- load gitsigns configurations
gitsigns.setup(config)

