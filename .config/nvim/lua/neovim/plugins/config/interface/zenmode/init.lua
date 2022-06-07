
-- ... init.lua

local ok, zenmode = pcall(require, "zen-mode")
if not ok then
  return
end

local config = {
  window = {

    -- shade the backdrop of the zen window. set to 1 to keep the same as normal
    backdrop = 0.95,

    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height

    -- width of the zen window
    width = 120,

    -- height of the zen window
    height = 1,

    -- by default, no options are changed for the zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {

    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,

      -- disables the ruler text in the cmd line area
      ruler = false,

      -- disables the command in the last line of the screen
      showcmd = false,
    },

    -- enable to start twilight when zen mode opens
    twilight = { enabled = true },

    -- disables git signs
    gitsigns = { enabled = false },

    -- disables the tmux statusline
    tmux = { enabled = false },

    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,

      -- font size increment
      font = "+4",
    },
  },

  -- callback where you can add custom code when the zen window opens
  on_open = function(win) end,

  -- callback where you can add custom code when the zen window closes
  on_close = function() end,
}

-- load zenmode configurations
zenmode.setup(config)

