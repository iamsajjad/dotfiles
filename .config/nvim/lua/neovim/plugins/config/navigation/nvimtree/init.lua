
-- ... init.lua

local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

local Mapper = require("neovim.core.mapper")

-- load nvimtree commands
local commands = require("neovim.plugins.config.navigation.nvimtree.commands")

local config = {

  -- reloads the explorer every time a buffer is written to.
  auto_reload_on_write = true,

  -- creating a file when the cursor is on a closed directory will set the path to be
  -- inside the closed directory, otherwise the parent directory.
  create_in_closed_folder = false,

  -- disables netrw completely
  disable_netrw = true,

  -- hijack netrw window on startup
  hijack_netrw = true,

  -- opens in place of the unnamed buffer if the buffer is empty.
  hijack_unnamed_buffer_when_opening = false,

  -- open the tree when running this setup function
  open_on_setup = false,

  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {},

  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,

  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir = {

    -- enable the feature
    enable = true,

    -- allow to open the tree if it was previously closed
    auto_open = true,
  },

  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,

  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = false,

  -- show lsp diagnostics in the signcolumn
  diagnostics = {
    enable = true,
  },

  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {

    -- enables the feature
    enable = true,

    -- update the root directory of the tree to the one of the folder containing the file
    -- if the file is not under the current root directory only relevant when `update_focused_file.enable` is true
    update_cwd = false,

    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },

  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {

    -- the command to run this, leaving nil should work in most cases
    cmd = nil,

    -- the command arguments as a list
    args = {},
  },

  git = {

    -- git configuration in the directory tree
    enable = true,

    -- hide ignored files and directories
    ignore = true,

    -- timeout
    timeout = 500,
  },

  view = {

    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 35,

    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,

    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = "left",

    -- if true the tree will resize itself after opening a file
    auto_resize = false,

    mappings = {

      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,

      -- list of mappings to set on the tree manually
      list = {},
    },
  },

  actions = {

    -- configuration when file is opened
    open_file = {

      window_picker = {
        enable = true,
      },
    },
  },

  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },

    -- configuration options for icons.
    icons = {

      -- configuration options for showing icon types.
      show = {

        -- show an icon before the file name. `nvim-web-devicons` will be used if
        -- available.
        file = true,

        -- show an icon before the folder name.
        folder = true,

        -- show a git status icon, see |renderer.icons.git_placement| requires
        -- |git.enable| `= true`
        git = true,
      },

      -- configuration options for icon glyphs.
      glyphs = {

        -- glyph for files. will be overridden by `nvim-web-devicons` if available.
        default = "",

        -- glyph for symlinks to files.
        symlink = "",

        -- glyphs for git status.
        git = {
          unstaged = "~",
          staged = "+",
          unmerged = "!",
          renamed = "≈",
          untracked = "?",
          deleted = "-",
        },
      },
    },
  },

  filters = {

    -- show dotfiles in the tree
    dotfiles = true,

    -- ignore files and directories
    custom = { ".git", "node_modules" },
  },
}

-- load nvimtree configurations
nvimtree.setup(config)

Mapper.map("n", "<C-n>", "<CMD>NvimTreeToggle<CR>")

