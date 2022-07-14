
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

  -- will ignore the buffer, when deciding to open the tree on setup.
  ignore_buffer_on_setup = false,

  -- open the tree when running this setup function
  open_on_setup = false,

  -- will automatically open the tree when running setup if startup buffer
  -- is a file, file window will be focused and file will be found if
  -- `update_focused_file` is enabled.
  open_on_setup_file = false,

  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = {},

  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,

  -- list of filetypes or buffer names that will prevent `open_on_tab` to open.
  ignore_buf_on_tab_change = {},

  -- changes how files within the same directory are sorted and the value can
  -- be one of `name`, `case_sensitive`, `modification_time` or `extension`.
  sort_by = "name",

  -- set preferred root directories, only relevant when
  -- `update_focused_file.update_root` is `true`.
  root_dirs = {},

  -- prefer startup root directory when updating root directory of the tree,
  -- only relevant when `update_focused_file.update_root` is `true`.
  prefer_startup_root = false,

  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir = {

    -- enable the feature
    enable = true,

    -- allow to open the tree if it was previously closed
    auto_open = true,
  },

  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,

  -- changes the tree root directory on `DirChanged` and refreshes the tree.
  sync_root_with_cwd = false,

  -- automatically reloads the tree on `bufenter` `nvimtree`.
  reload_on_bufenter = false,

  -- will change `cwd` of `nvimtree` to that of new buffer's when opening `nvimtree`.
  respect_buf_cwd = false,

  -- function ran when creating the `nvim-tree` buffer this can be used to
  -- attach keybindings to the tree buffer when on_attach is `"disabled"`, it
  -- will use the older mapping strategy otherwise it will use the newer one.
  on_attach = "disable",

  -- to remove the default mappings in the tree remove specific keys via passing
  -- a `string` table of keys like the following example `{ "<C-o>", "<CR>", "o", "<Tab>" }`
  -- or remove all default mappings via passing `true` or ignore via passing `false`
  remove_keymaps = false,

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

    -- resize the window on each draw based on the longest line,
    -- only works when `|nvim-tree.view.side|` is `left` or `right`.
    adaptive_size = false,

    -- when entering `nvimtree`, reposition the view so that the current node
    -- is initially centralized, see `zz`.
    centralize_selection = false,

    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
    width = 35,

    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
    height = 30,

    -- hide the path of the current working directory on top of the tree.
    hide_root_folder = false,

    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = "left",

    -- preserves window proportions when opening a file, if `false`, the
    -- height and width of windows other than `nvimtree` will be equalized.
    preserve_window_proportions = false,

    -- print the line number in front of each line.
    number = false,

    -- show the line number relative to the line with the cursor in front of
    -- each line, if the option `view.number` is also `true`, the number on the
    -- cursor line will be the line number instead of `0`.
    relativenumber = false,

    -- show diagnostic sign column. value can be `"yes"`, `"auto"`, `"no"`.
    signcolumn = "yes",

    -- if true the tree will resize itself after opening a file
    auto_resize = false,

    mappings = {

      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,

      -- list of mappings to set on the tree manually
      list = {},
    },

    -- configuration options for floating window.
    float = {

      -- display `nvim-tree` window as float enforces
      -- `nvim-tree.actions.open_file.quit_on_open` if the option is set.
      enable = false,

      -- floating window config, see help page for `nvim_open_win` for more details.
      open_win_config = {

        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
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

    -- appends a trailing slash to folder names.
    add_trailing = false,

    -- compact folders that only contain a single folder into one node
    -- in the file tree.
    group_empty = false,

    -- enable file highlight for git attributes using `nvimtreegit*` highlight groups.
    -- this can be used with or without the icons.
    highlight_git = false,

    -- display node whose name length is wider than the width of `nvimtree` window in
    -- floating window.
    full_name = false,

    -- highlight icons and/or names for opened files, value can be `"none"`, `"icon"`,
    -- `"name"` or `"all"`.
    highlight_opened_files = "none",

    -- in what format to show root folder, see `:help filename-modifiers` for
    -- available options.
    root_folder_modifier = ":~",

    -- hold the number of spaces for an each tree nesting level, minimum `1`.
    indent_width = 2,
    indent_markers = {
      enable = true,

      -- display folder arrows in the same column as indent marker when
      -- using `renderer.icons.show.folder_arrow`.
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },

    -- configuration options for icons.
    icons = {

      -- use the webdev icon colors, otherwise `NvimTreeFileIcon`.
      webdev_colors = true,

      -- place where the git icons will be rendered, can be `"after"` or `"before"`
      -- filename (after the `file` and `directory` icons) or `"signcolumn"` requires
      -- `view.signcolumn` enabled note that the diagnostic signs will take precedence
      -- over the git signs.
      git_placement = "before",

      -- inserted between icon and filename, use with caution, it could break
      -- rendering if you set an empty string depending on your font.
      padding = " ",

      -- used as a separator between `symbolic link's` source and target.
      symlink_arrow = " ➛ ",

      -- configuration options for showing icon types.
      show = {

        -- show an icon before the file name. `nvim-web-devicons` will be used if
        -- available.
        file = true,

        -- show an icon before the folder name.
        folder = true,

        -- show a small arrow before the folder icon, requires the option
        -- `renderer.icons.show.folder` value to be `true` and the option
        -- `renderer.indent_markers.enable` value to be `false`.
        folder_arrow = true,

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

        -- glyph for bookmarks files.
        bookmark = "",

        -- glyphs for directories.
        folder = {},

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

