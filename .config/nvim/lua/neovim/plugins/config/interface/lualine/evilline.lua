
-- ... evilline.lua

-- evilline config for lualine
local lualine = require("lualine")

-- color table for highlights
-- stylua: ignore
local colors = {
    bg       = "#000000",
    fg       = "#bbc2cf",
    yellow   = "#ECBE7B",
    cyan     = "#008080",
    darkblue = "#081633",
    green    = "#98be65",
    orange   = "#FF8800",
    violet   = "#a9a1e1",
    magenta  = "#c678dd",
    blue     = "#51afef",
    red      = "#ec5f67",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- config
local config = {
  options = {

    -- disable sections and component separators
    component_separators = "",
    section_separators = "",

    -- unified global statusline
    globalstatus = true,

    theme = {

      -- we are going to use lualine_c an lualine_x as left and
      -- right section. both are highlighted by c theme .  so we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {

    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},

    -- these will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {

    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return "▊"
  end,

  -- sets highlighting of component
  color = { fg = colors.blue },

  -- remove space before this
  padding = { left = 0, right = 1 },
})

ins_left({

  -- mode component
  function()

        -- auto change color according to neovims mode
        -- stylua: ignore
        local mode_color = {
            n      = colors.red,
            i      = colors.green,
            v      = colors.blue,
            [""] = colors.blue,
            V      = colors.blue,
            c      = colors.magenta,
            no     = colors.red,
            s      = colors.orange,
            S      = colors.orange,
            [""] = colors.orange,
            ic     = colors.yellow,
            R      = colors.violet,
            Rv     = colors.violet,
            cv     = colors.red,
            ce     = colors.red,
            r      = colors.cyan,
            rm     = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"]  = colors.red,
            t      = colors.red,
        }
    vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
    return ""
  end,
  color = "LualineMode",
  padding = { right = 1 },
})

ins_left({

  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

ins_left({
  "diagnostics",
  sources = { "nvim_lsp" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
})

-- insert mid section. you can make any number of sections in neovim
-- for lualine it's any number greater then 2
ins_left({
  function()
    return "%="
  end,
})

ins_left({

  -- lsp server name
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
})

-- add components to right sections
ins_right({
  "o:encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.green, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
})

ins_right({
  "diff",
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
})

-- setup lualine with evilline config
lualine.setup(config)

