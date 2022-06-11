
-- ... init.lua

local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

local config = {

  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,

  -- binding
  open_mapping = [[<C-t>]],

  -- hide the number column in toggleterm buffers
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,

  -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  shading_factor = 1,
  start_in_insert = true,

  -- whether or not the open mapping applies in insert mode
  insert_mappings = true,
  persist_size = true,

  -- direction can be "vertical" | "horizontal" | "window" | "float"
  direction = "vertical",

  -- close the terminal window when the process exits
  close_on_exit = true,

  -- change the default shell
  shell = vim.o.shell,

  -- this field is only relevant if direction is set to "float"
  float_opts = {

    -- the border key is *almost* the same as "nvim_open_win"
    -- see :h nvim_open_win for details on borders however
    -- the "curved" border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border styles "single" | "double" | "shadow" | "curved" | ... other options supported by win open
    border = "curved",

    -- float window size
    -- width = <value>,
    -- height = <value>,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

-- load toggleterm configurations
toggleterm.setup(config)

