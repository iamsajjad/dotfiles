
-- ... init.lua

local directory = "neovim.bindings" .. "."

local modules = {
  "leader",
  "common",
  "insert",
  "normal",
  "visual",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, directory .. module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

