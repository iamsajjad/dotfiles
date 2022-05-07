
-- ... utilities.lua

local api = vim.api
local map = api.nvim_set_keymap
local bufmap = api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

local U = {}

local formatting = vim.api.nvim_create_augroup("Formatting", { clear = true })

---common format-on-save for lsp servers that implements formatting
---@param client table
---@param buffer integer
function U.fmt_on_save(client, buffer)
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

---make luajit runtime files discoverable to the server
function U.get_luajit_path()
  local luajit_path = vim.split(package.path, ";")
  table.insert(luajit_path, "lua/?.lua")
  table.insert(luajit_path, "lua/?/init.lua")
  return luajit_path
end

---make neovim runtime files discoverable to the server
function U.get_nvim_rtp_path()
  return { os.getenv("VIMRUNTIME") }
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

