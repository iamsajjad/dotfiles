
-- ... getpacker.lua

local fn = vim.fn

local PackerInitializer = {}

-- packer `plugins manager` repository directory location
local directory = string.format("%s/site/pack/packer/start/", fn.stdpath("data"))

-- to run file do :luafile %
function PackerInitializer.clone()
  if fn.input("Download Packer? [ y for yes ] : ") ~= "y" then
    return
  end

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

function PackerInitializer.init()
  -- check if `packer.nvim` directory exists
  if fn.empty(fn.glob(directory .. "packer.nvim")) > 0 then
    -- packer is cloned in `start` directory
    -- if packer is not installed clone packer to `start` directory
    PackerInitializer.clone()

    -- packer is cloned in `start` directory
    return true
  else
    -- packer is already exists in `start` directory
    return true
  end

  -- return false otherwise
  return false
end

return PackerInitializer

