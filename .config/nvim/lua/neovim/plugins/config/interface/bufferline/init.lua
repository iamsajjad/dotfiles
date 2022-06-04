
-- ... init.lua

local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

local config = {
  options = {

    -- set to "tabs" to only show tabpages instead
    mode = "buffers",

    -- numbers options "none" | "ordinal" | "buffer_id" | "both" or
    -- numbers = function(ordinal, id, lower, raise)
    --   -- return string
    -- end,
    numbers = "none",

    -- can be a string | function, see "Mouse actions"
    close_command = "bdelete! %d",

    -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d",

    -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",

    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,

    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",

    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)
      -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match("%.md") then
        return vim.fn.fnamemodify(buf.name, ":t:r")
      end
    end,

    max_name_length = 18,

    -- prefix used when a buffer is de-duplicated
    max_prefix_length = 30,
    tab_size = 25,
    diagnostics = false,
    diagnostics_update_in_insert = false,

    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return ("(%s)"):format(count)
    end,

    -- NOTE: this will be called a lot so don't do any heavy processing here
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end

      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end

      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end

      -- filter out by it's index number in list (don't show first buffer)
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,

    -- offsets example
    -- {{ function, text_align = text_align = "left" | "center" | "right" }, ... },
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "PanelHeading",
        text = "NvimTree",
      },
      {
        filetype = "packer",
        highlight = "PanelHeading",
        text = "Packer",
      },
    },

    -- whether or not to add the filetype icon highlights
    color_icons = true,

    -- disable filetype icons for buffers
    show_buffer_icons = true,

    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,

    -- whether or not custom sorted buffers should persist
    persist_buffer_sort = true,

    -- can also be a table containing two custom separators
    -- [focused and unfocused]. eg: { "|", "|" }
    -- separators styles "slant" | "thick" | "thin" | { "any", "any" },
    separator_style = "thin",

    enforce_regular_tabs = true,
    always_show_bufferline = true,

    -- sort by options "insert_after_current" |"insert_at_end" | "id" | "extension" |
    -- "relative_directory" | "directory" | "tabs" or
    -- sort_by = function(buffer_a, buffer_b)
    --
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end,
    sort_by = "insert_after_current",
  },
}

-- load bufferline configurations
bufferline.setup(config)

