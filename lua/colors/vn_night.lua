require("vn-night").setup()

local highlights = {
  -- Highlight Yank
  YankHighlight = { bg = "#b47109" },

  -- Markdown support
  Conceal = { fg = "#fe8019" },
  pandocDelimitedCodeBlock = { fg = "#b9f27c" },
  pandocNoFormatted = { fg = "#CF4F6D" },

  -- Highligh Folding
  Folded = { fg = "#96e2f0", bg = "none" },

  -- Highligh for search
  HlSearchFloat = { fg = "#2e222f", bg = "#fb6b1d" },
  HlSearchLens = { fg = "#fb6b1d", bg = "none", bold = true, italic = true },

  -- Whichkey colors
  WhichKeyDesc = { link = "Keyword" },
  WhichKeyGroup = { link = "Identifier" },

  -- Qf colors
  qfPath = { fg = "#FF5C8F" },
  qfPosition = { fg = "#64657E" },
  QuickFixLine = { fg = "none" },

  -- Color column
  ColorColumn = { bg = "none" },

  -- Curosr Line Color
  Cursorline = { bg = "none" },
  Beacon = { bg = "white" },

  -- Transparent background floating
  NormalFloat = { bg = "#10081D" },
  CmpDocWin = { bg = "none" },
  Pmenu = { bg = "none" },
  PmenuSbar = { bg = "none" },
  PmenuThumb = { bg = "white" },
  PmenuSel = { bold = true, fg = "#24283b", bg = "#b9f27c" },
  CmpItemAbbrMatchFuzzyDefault = { fg = "#b9f27c" },
  CmpItemAbbrMatch = { fg = "orange" },
  CmpItemAbbr = { link = "Comment" },

  -- Match brackets colors
  MatchParen = { italic = true },

  -- Galaxyline
  StatusLine = { bg = "none" },
  StatusLineNC = { bg = "none" },

  -- Signature help
  LspSignatureActiveParameter = { fg = "#f79617" },
}

-- Transperency
vim.cmd [[hi SignColumn guibg=none]]
vim.cmd [[hi CursorLineNR guibg=None]]
vim.cmd [[hi Normal guibg=none]]

-- Whichkey colors
vim.cmd [[hi WhichKeyFloat guibg=none]]

for group, options in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, options)
end
