
-- ... bindings.lua

local Mapper = require("neovim.core.mapper")

local Bindings = {}

-- diagnostic options
local diagnosticOpts = { noremap = true, silent = true, expr = false }

-- diagnostic bindings
Mapper.map("n", "<space>e", vim.diagnostic.open_float, diagnosticOpts)
Mapper.map("n", "[d", vim.diagnostic.goto_prev, diagnosticOpts)
Mapper.map("n", "]d", vim.diagnostic.goto_next, diagnosticOpts)
Mapper.map("n", "<space>q", vim.diagnostic.setloclist, diagnosticOpts)

-- LSP bindings
-- @param buffer number
function Bindings.init(buffer)
  -- options with specific buffer number
  local lspOpts = { noremap = true, silent = true, expr = false, buffer = buffer }

  -- see `:help vim.lsp.*` for documentation on any of the below functions
  Mapper.map("n", "gD", vim.lsp.buf.declaration, lspOpts)
  Mapper.map("n", "gd", vim.lsp.buf.definition, lspOpts)
  Mapper.map("n", "K", vim.lsp.buf.hover, lspOpts)
  Mapper.map("n", "gi", vim.lsp.buf.implementation, lspOpts)
  Mapper.map("n", "<C-k>", vim.lsp.buf.signature_help, lspOpts)
  Mapper.map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, lspOpts)
  Mapper.map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, lspOpts)
  Mapper.map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, lspOpts)
  Mapper.map("n", "<space>D", vim.lsp.buf.type_definition, lspOpts)
  Mapper.map("n", "<space>rn", vim.lsp.buf.rename, lspOpts)
  Mapper.map("n", "<space>ca", vim.lsp.buf.code_action, lspOpts)
  Mapper.map("n", "gr", vim.lsp.buf.references, lspOpts)
  Mapper.map("n", "<space>f", vim.lsp.buf.format, lspOpts)
end

return Bindings

