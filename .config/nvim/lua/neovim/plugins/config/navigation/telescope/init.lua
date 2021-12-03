
-- ... init.lua

local U = require("neovim.core.utilities")
local finders = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup({
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
})

function _G.__telescope_open(fn)
  U.move_cursor_from_tree()
  finders[fn]({
    hidden = true,
  })
end

-- ctrl-p = fuzzy finder
U.map("n", "<C-P>", "<CMD>lua __telescope_open('find_files')<CR>")

-- fuzzy find active buffers
U.map("n", "'b", "<CMD>lua __telescope_open('buffers')<CR>")

-- search for string
U.map("n", "'r", "<CMD>lua __telescope_open('live_grep')<CR>")

-- fuzzy find history buffers
U.map("n", "'i", "<CMD>lua __telescope_open('oldfiles')<CR>")

-- fuzzy find changed files in git
U.map("n", "'c", "<CMD>lua __telescope_open('git_status')<CR>")

-- fuzzy find register
U.map("n", "'g", "<CMD>lua __telescope_open('registers')<CR>")

