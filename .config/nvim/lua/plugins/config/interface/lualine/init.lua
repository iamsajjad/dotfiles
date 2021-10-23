
-- ... init.lua

local directory = "plugins.config.interface.lualine" .. "."

local modules = {

  -- insert config modules here

  -- add lualine styles here
  -- use comment and uncomment to toggle lualine styles
  -- "bubbles",
  "evilline",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, directory .. module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

