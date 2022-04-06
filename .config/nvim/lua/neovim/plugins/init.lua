
-- ... init.lua

local directory = "neovim.plugins" .. "."

-- clone packer for first time only
if require(directory .. "getpacker").init() then
  return
end

local modules = {
  "config",
  "gamma",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, directory .. module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

