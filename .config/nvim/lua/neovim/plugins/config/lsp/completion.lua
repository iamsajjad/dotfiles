
-- ... completion.lua

local completion = require("cmp")

local config = {
  mapping = {
    ["<C-d>"] = completion.mapping.scroll_docs(-4),
    ["<C-f>"] = completion.mapping.scroll_docs(4),
    ["<C-q>"] = completion.mapping.close(),
    ["<C-y>"] = completion.mapping.confirm({ select = true }),
    ["<C-Space>"] = completion.mapping.complete(),
    ["<CR>"] = completion.mapping.confirm({
      behavior = completion.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = completion.config.sources({
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "path", max_item_count = 10 },
    { name = "luasnip", max_item_count = 5 },
    { name = "buffer", max_item_count = 8 },
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
}

-- load completion configurations
completion.setup(config)

