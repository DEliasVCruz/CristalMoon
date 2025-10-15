local status_ok, incline = pcall(require, "incline")
if not status_ok then
  return
end

local devicons = require "nvim-web-devicons"
local helpers = require "incline.helpers"

incline.setup {
  window = {
    padding = 0,
    margin = { horizontal = 0 },
  },
  hide = {
    cursorline = "focused_win",
    focused_win = false,
    only_win = "count_ignored",
  },

  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
    if filename == "" then
      filename = "[No Name]"
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)
    local modified = vim.bo[props.buf].modified
    return {
      ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
      " ",
      { filename, gui = modified and "bold,italic" or "bold" },
      { modified and " ●" or "", guifg = "#d19a66" },
      " ",
      guibg = "#44406e",
    }
  end,
}
