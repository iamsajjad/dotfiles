
-- ... utilities.lua

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

return U

