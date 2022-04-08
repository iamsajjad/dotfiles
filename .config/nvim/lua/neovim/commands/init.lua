
-- ... init.lua

local directory = "neovim.commands" .. "."

local modules = {
  "compile",
  "checktime",
  "endspace",
  "filetypes",
  "numbersmode",
  "onyank",
  "help",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, directory .. module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

