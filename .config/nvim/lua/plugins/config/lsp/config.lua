
-- ... config.lua

local config = require("lspconfig")
local U = require("plugins.config.lsp.utilities")

local capabilities = U.capabilities()

-- languages servers flags
local flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 200,
}

-- configure native diagnostics
vim.diagnostic.config({
  virtual_text = {
    source = "always",
  },
  float = {
    source = "always",
  },
})

-- make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Lua
config.sumneko_lua.setup({
  cmd = { "lua-language-server" },
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
  settings = {
    Lua = {
      completion = {
        enable = true,
        showWord = "Disable",
      },
      runtime = {
        -- tell the language server which version of lua you're using (most likely luajit in the case of neovim)
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make the server aware of neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Rust
config.rust_analyzer.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
      },
    },
  },
})

-- Zig
config.zls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
})

-- Golang
config.gopls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
})

-- Typescript
config.tsserver.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
})

-- Python
config.pyright.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
})
-- Eslint
config.eslint.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client)
    U.disable_formatting(client)
  end,
})

-- Json
config.jsonls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buffer)
    U.disable_formatting(client)
    U.mappings(buffer)
  end,
})

