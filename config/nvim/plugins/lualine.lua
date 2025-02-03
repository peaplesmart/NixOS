local lualine = require("lualine")
require 'lualine'.setup{
options = {
  icons_enable = true,
  theme = "gruvbox-material",
  component_separators = { left = '\u{e0b1}', right = '\u{e0b3}' },
    section_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "branch", "diff", "diagnosticcs" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = {
      {
        function()
          local loc = require("lualine.components.location")()
          local sel = require("lualine.components.selectioncount")()
          if sel ~= "" then
            loc = loc .. " (" .. sel .. " sel)"
          end
        return loc
        end,
        separator = { right = ""},
        left_padding = 2,
      },
    },
  },
  extensions = { "nvim-tree" },
}
