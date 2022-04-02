
-- ... config.lua

local cmd = vim.api.nvim_command

-- only required if you have packer in your `opt` pack
cmd([[packadd packer.nvim]])

return require("packer").startup({

  function(use)
    -- packer can manage itself
    use({ "wbthomason/packer.nvim", opt = true })

    use({ "nvim-lua/plenary.nvim" })

    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("neovim.plugins.config.interface.devicons")
      end,
    })

    use({
      "numToStr/Sakura.nvim",
      config = function()
        require("neovim.plugins.config.interface.sakura")
      end,
    })

    use({
      "EdenEast/nightfox.nvim",
      config = function()
        require("neovim.plugins.config.interface.nightfox")
      end,
    })

    use({
      "rebelot/kanagawa.nvim",
      config = function()
        require("neovim.plugins.config.interface.kanagawa")
      end,
    })

    use({
      "nvim-lualine/lualine.nvim",
      event = "BufEnter",
      config = function()
        require("neovim.plugins.config.interface.lualine")
      end,
    })

    use({
      "akinsho/bufferline.nvim",
      event = "BufEnter",
      config = function()
        require("neovim.plugins.config.interface.bufferline")
      end,
    })

    use({
      {
        "nvim-treesitter/nvim-treesitter",
        event = "CursorHold",
        run = ":TSUpdate",
        config = function()
          require("neovim.plugins.config.integration.treesitter")
        end,
      },
      {
        "nvim-treesitter/playground",
        after = "nvim-treesitter",
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
      },
      {
        "nvim-treesitter/nvim-treesitter-refactor",
        after = "nvim-treesitter",
      },
      {
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter",
      },
    })

    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.interface.indentline")
      end,
    })

    use({
      "norcalli/nvim-colorizer.lua",
      event = "CursorHold",
      config = function()
        require("neovim.plugins.config.interface.colorizer")
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.integration.gitsigns")
      end,
    })

    use({
      "rhysd/git-messenger.vim",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.integration.gitmessenger")
      end,
    })

    use({
      "kyazdani42/nvim-tree.lua",
      event = "CursorHold",
      config = function()
        require("neovim.plugins.config.navigation.nvimtree")
      end,
    })

    use({
      {
        "nvim-telescope/telescope.nvim",
        event = "CursorHold",
        config = function()
          require("neovim.plugins.config.navigation.telescope")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        after = "telescope.nvim",
        run = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-symbols.nvim",
        after = "telescope.nvim",
      },
    })

    use({
      "numtostr/Navigator.nvim",
      event = "CursorHold",
      config = function()
        require("neovim.plugins.config.navigation.navigator")
      end,
    })

    use({
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.navigation.hop")
      end,
    })

    use({
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
        require("neovim.plugins.config.navigation.neoscroll")
      end,
    })

    use({
      "ethanholz/nvim-lastplace",
      config = function()
        require("neovim.plugins.config.navigation.lastplace")
      end,
    })

    use({
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.code.comment")
      end,
    })

    use({
      "tpope/vim-surround",
      event = "BufRead",
      requires = {
        {
          "tpope/vim-repeat",
          event = "BufRead",
        },
      },
      config = function()
        require("neovim.plugins.config.code.surround")
      end,
    })

    use({
      "wellle/targets.vim",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.code.targets")
      end,
    })

    use({
      "ntpeters/vim-better-whitespace",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.code.whitespace")
      end,
    })

    use({
      "AndrewRadev/splitjoin.vim",
      -- NOTE: splitjoin won't work with `BufRead` event
      event = "CursorHold",
      config = function()
        require("neovim.plugins.config.code.splitjoin")
      end,
    })

    use({
      "akinsho/toggleterm.nvim",
      event = "BufWinEnter",
      config = function()
        require("neovim.plugins.config.terminal.toggleterm")
      end,
    })

    use({
      "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require("neovim.plugins.config.lsp.config")
      end,
      requires = {
        {
          "hrsh7th/cmp-nvim-lsp",
          "williamboman/nvim-lsp-installer",
        },
      },
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("neovim.plugins.config.lsp.nullls")
      end,
    })

    use({
      {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
          require("neovim.plugins.config.lsp.completion")
        end,
        requires = {
          {
            "L3MON4D3/LuaSnip",
            event = "CursorHold",
            config = function()
              require("neovim.plugins.config.lsp.snippets")
            end,
            requires = { "rafamadriz/friendly-snippets" },
          },
        },
      },
      {
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
      },
      {
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
      },
      {
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
      },
    })

    -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
    use({
      "windwp/nvim-autopairs",
      event = "InsertCharPre",
      after = "nvim-cmp",
      config = function()
        require("neovim.plugins.config.code.autopairs")
      end,
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

