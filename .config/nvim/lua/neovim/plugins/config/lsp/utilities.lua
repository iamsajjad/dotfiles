
-- ... utilities.lua

local api = vim.api
local map = api.nvim_set_keymap
local bufmap = api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

local U = {}

---common format-on-save for lsp servers that implements formatting
---@param client table
function U.fmt_on_save(client)
  if client.resolved_capabilities.document_formatting then
    api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

---LSP servers capabilities w/ nvim-cmp
function U.capabilities()
  -- the nvim-cmp almost supports lsp's capabilities so you should advertise it to lsp servers..
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

---disable formatting for servers. handles by null-ls
---@param client table
function U.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

---Diagnostic mappings
map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

---LSP mappings
---@param bufnr number
function U.mappings(bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  bufmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  bufmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  bufmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  bufmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  bufmap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  bufmap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  bufmap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  bufmap(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  bufmap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  bufmap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  bufmap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  bufmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  bufmap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

return U

