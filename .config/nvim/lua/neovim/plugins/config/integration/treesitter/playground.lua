
-- ... playground.lua

local PlayGround = {
  enable = true,
  disable = {},

  -- debounced time for highlighting nodes in the
  -- playground from source code
  updatetime = 25,

  -- whether the query persists across vim sessions
  persist_queries = false,
}

return PlayGround

