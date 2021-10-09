local M = {}
-- returns a table of colors for givem or current theme
M.get = function(theme)
  if not theme then
    theme = vim.g.nvchad_theme
  end

  return require("hl_themes." .. theme)
end

return M
