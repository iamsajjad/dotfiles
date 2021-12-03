
-- ... configure.lua

local directory = "neovim" .. "."

local modules = {
  "core",
  "commands",
  "bindings",
  "functions",
  "plugins",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, directory .. module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

-- debugging
function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

