
-- ... getpacker.lua

local fn = vim.fn

local Packer = {}

-- to run file do :luafile %
local clone = function()
  if fn.input("Download Packer? [ y for yes ] : ") ~= "y" then
    return
  end

  -- packer `plugins manager` directory location
  local directory = string.format("%s/site/pack/packer/start/", fn.stdpath("data"))

  -- make packer directory
  fn.mkdir(directory, "p")

  -- clone packer
  local out = fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(out)
  print("Downloading packer.nvim...")
  print("( You'll need to restart now )")
end

function Packer.init()
  if not pcall(require, "packer") then
    clone()

    return true
  end

  return false
end

return Packer

