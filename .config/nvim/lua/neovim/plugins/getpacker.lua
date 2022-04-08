
-- ... getpacker.lua

local fn = vim.fn

local PackerInitializer = {}

-- packer `plugins manager` repository directory location
local directory = string.format("%s/site/pack/packer/opt/", fn.stdpath("data"))

-- clone `packer` to `opt` directory
function PackerInitializer.clone()
  if fn.input("Packer not found in `opt` directory, Clone Packer ? [y/N] : ") ~= "y" then
    return
  end

  -- make packer directory
  fn.mkdir(directory, "p")

  print(string.format(" %s ", "cloning `packer.nvim` ..."))

  -- clone packer
  local out = fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
  )

  print(string.format("%s", out))
  print("Restart the neovim instance to load `packer`")
end

function PackerInitializer.init()
  -- check if `packer.nvim` directory exists
  if fn.empty(fn.glob(directory .. "packer.nvim")) > 0 then
    -- packer is cloned in `opt` directory
    -- if packer is not installed clone packer to `opt` directory
    PackerInitializer.clone()

    -- packer is cloned in `opt` directory
    return true
  else
    -- packer is already exists in `opt` directory
    return true
  end

  -- return false otherwise
  return false
end

return PackerInitializer

