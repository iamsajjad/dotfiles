
-- ... init.lua

local U = require("neovim.core.utilities")
local Mapper = require("neovim.core.mapper")

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local finders = require("telescope.builtin")
local actions = require("telescope.actions")

local config = {
  defaults = {
    prompt_prefix = " ❯ ",
    initial_mode = "insert",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-o>"] = function()
          return
        end,
        ["<TAB>"] = actions.toggle_selection + actions.move_selection_next,
        ["<C-s>"] = actions.send_selected_to_qflist,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      -- override the generic sorter
      override_generic_sorter = true,
      -- override the file sorter
      override_file_sorter = true,
      -- "smart_case" | "ignore_case" | "respect_case"
      case_mode = "smart_case",
    },
  },
}

-- load telescope configurations
telescope.setup(config)

local function telescope_open(fn)
  U.move_cursor_from_tree()
  finders[fn]({
    hidden = true,
  })
end

-- ctrl-p = fuzzy finder
Mapper.map("n", "<C-p>", function()
  telescope_open("find_files")
end)

-- fuzzy find active buffers
Mapper.map("n", "'b", function()
  telescope_open("buffers")
end)

-- search for string
Mapper.map("n", "'r", function()
  telescope_open("live_grep")
end)

-- fuzzy find history buffers
Mapper.map("n", "'i", function()
  telescope_open("oldfiles")
end)

-- fuzzy find changed files in git
Mapper.map("n", "'c", function()
  telescope_open("git_status")
end)

-- fuzzy find register
Mapper.map("n", "'g", function()
  telescope_open("registers")
end)

-- fuzzy find help page tag
Mapper.map("n", "'h", function()
  telescope_open("help_tags")
end)

