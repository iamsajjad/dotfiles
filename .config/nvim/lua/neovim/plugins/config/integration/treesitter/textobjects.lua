
-- ... textobjects.lua

local TextObjects = {

  select = {
    enable = true,

    -- automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {

      -- you can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",

      -- or you can define your own textobjects like this
      -- ["iF"] = {
      --     python = "(function_definition) @function",
      --     cpp = "(function_definition) @function",
      --     c = "(function_definition) @function",
      --     java = "(method_declaration) @function",
      -- },
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
      ["<leader>f"] = "@function.outer",
      ["<leader>e"] = "@element",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
      ["<leader>F"] = "@function.outer",
      ["<leader>E"] = "@element",
    },
  },
  move = {
    enable = true,

    -- whether to set jumps in the jumplist
    set_jumps = true,
    goto_next_start = {
      ["]f"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]F"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[f"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[F"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },
}

return TextObjects

