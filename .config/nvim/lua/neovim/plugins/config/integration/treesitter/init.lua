
-- ... init.lua

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

local treesitter = require("nvim-treesitter.configs")

local config = {

  -- nvim-treesitter/nvim-treesitter (self config)
  ensure_installed = "all",
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>si",
      node_incremental = "<leader>sn",
      node_decremental = "<leader>sN",
      scope_incremental = "<leader>sc",
    },
  },

  -- nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {

        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",

        -- Or you can define your own textobjects like this
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
  },

  -- windwp/nvim-ts-autotag
  autotag = {
    enable = true,
  },

  -- nvim-treesitter/playground
  playground = {
    enable = true,
    disable = {},

    -- Debounced time for highlighting nodes in the playground from source code
    updatetime = 25,

    -- Whether the query persists across vim sessions
    persist_queries = false,
  },

  -- nvim-treesitter/nvim-treesitter-refactor
  refactor = {
    highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = false },
  },
}

-- load treesitter configurations
treesitter.setup(config)

