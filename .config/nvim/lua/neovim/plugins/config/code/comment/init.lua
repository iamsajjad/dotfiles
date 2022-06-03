
-- ... init.lua

local ok, comment = pcall(require, "Comment")
if not ok then
  return
end

local config = {

  -- add a space b/w comment and the line
  -- @type boolean|fun():boolean
  padding = true,

  -- whether the cursor should stay at its position
  -- NOTE: this only affects normal mode mappings and doesn't work with dot-repeat
  -- @type boolean
  sticky = true,

  -- lines to be ignored while comment/uncomment.
  -- could be a regex string or a function that returns a regex string.
  -- example: use '^$' to ignore empty lines
  -- @type string|fun():string
  ignore = nil,

  -- LHS of toggle mappings in NORMAL + VISUAL mode
  -- @type table
  toggler = {

    -- line-comment toggle keymap
    line = "gcc",

    -- block-comment toggle keymap
    block = "gbc",
  },

  -- LHS of operator-pending mappings in NORMAL + VISUAL mode
  -- @type table
  opleader = {

    -- line-comment keymap
    line = "gc",

    -- block-comment keymap
    block = "gb",
  },

  -- LHS of extra mappings
  -- @type table
  extra = {

    -- add comment on the line above
    above = "gcO",

    -- add comment on the line below
    below = "gco",

    -- add comment at the end of line
    eol = "gcA",
  },

  -- create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  -- @type table
  mappings = {

    -- operator-pending mapping
    -- includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
    -- NOTE: these mappings can be changed individually by `opleader` and `toggler` config
    basic = true,

    -- extra mapping
    -- includes `gco`, `gco`, `gca`
    extra = true,

    -- extended mapping
    -- includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extended = false,
  },

  -- pre-hook, called before commenting the line
  -- @type fun(ctx: Ctx):string
  pre_hook = nil,

  -- post-hook, called after commenting is done
  -- @type fun(ctx: Ctx)
  post_hook = nil,
}

-- load comment configurations
comment.setup(config)

