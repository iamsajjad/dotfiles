
-- ... init.lua

-- hold configurations for `interface` namespace that need to be
-- loaded after the configurations of each plugin under `interface`
-- namespace is loaded

local api = vim.api

local Interface = {}

function Interface.configure()
  -- configure interface plugins here.
end

function Interface.colors(name)
  -- set or change interface colorscheme
  api.nvim_command(("colorscheme %s"):format(name))
end

return Interface

