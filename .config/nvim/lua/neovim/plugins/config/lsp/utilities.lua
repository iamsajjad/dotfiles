
-- ... utilities.lua

local Mapper = require("neovim.core.mapper")

local U = {}

local formatting = vim.api.nvim_create_augroup("Formatting", { clear = true })

---common format-on-save for lsp servers that implements formatting
---@param client table
---@param buffer integer
function U.format_on_save(client, buffer)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting,
      buffer = buffer,
      callback = function()
        vim.lsp.buf.format({
          timeout_ms = 3000,
          buffer = buffer,
        })
      end,
    })
  end
end

---LSP servers capabilities w/ nvim-cmp
function U.capabilities()
  -- the nvim-cmp almost supports lsp's capabilities so you should advertise it to lsp servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

---Diagnostic mappings
local opts = { noremap = true, silent = true, expr = false }
Mapper.map("n", "<space>e", vim.diagnostic.open_float, opts)
Mapper.map("n", "[d", vim.diagnostic.goto_prev, opts)
Mapper.map("n", "]d", vim.diagnostic.goto_next, opts)
Mapper.map("n", "<space>q", vim.diagnostic.setloclist, opts)

---LSP mappings
---@param buffer number
function U.mappings(buffer)
  -- options with specific buffer number
  opts = { noremap = true, silent = true, expr = false, buffer = buffer }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  Mapper.map("n", "gD", vim.lsp.buf.declaration, opts)
  Mapper.map("n", "gd", vim.lsp.buf.definition, opts)
  Mapper.map("n", "K", vim.lsp.buf.hover, opts)
  Mapper.map("n", "gi", vim.lsp.buf.implementation, opts)
  Mapper.map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  Mapper.map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  Mapper.map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  Mapper.map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  Mapper.map("n", "<space>D", vim.lsp.buf.type_definition, opts)
  Mapper.map("n", "<space>rn", vim.lsp.buf.rename, opts)
  Mapper.map("n", "<space>ca", vim.lsp.buf.code_action, opts)
  Mapper.map("n", "gr", vim.lsp.buf.references, opts)
  Mapper.map("n", "<space>f", vim.lsp.buf.format, opts)
end

return U

