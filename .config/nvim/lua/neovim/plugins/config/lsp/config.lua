
-- ... config.lua

local ok, config = pcall(require, "lspconfig")
if not ok then
  return
end

local U = require("neovim.plugins.config.lsp.utilities")

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

-- Lua
config.sumneko_lua.setup({
  cmd = { "lua-language-server" },
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
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
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make the server aware of neovim runtime files
        library = { os.getenv("VIMRUNTIME") },
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
  on_attach = function(_, buffer)
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

-- C / C++ / Objective-C / Objective-C++
config.clangd.setup({
  flags = flags,
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp" },
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

-- Golang
config.gopls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

-- Zig
config.zls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

-- Eslint
config.eslint.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_) end,
})

-- Typescript
config.tsserver.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

-- Python
config.pyright.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

-- Yaml
config.yamlls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

-- Json
config.jsonls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(_, buffer)
    U.mappings(buffer)
  end,
})

