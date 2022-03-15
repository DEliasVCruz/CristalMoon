require("vn-night").setup()

local highlights = {
  -- Highlight Yank
  YankHighlight = { bg = "#b47109" },

  -- -- Transperency
  SignColumn = { fg = "#E3E4FD", bg = nil },
  CursorLineNR = { bold = true, fg = "#f79617", bg = nil },
  Normal = { fg = "#E3E4FD", bg = nil },

  -- Markdown support
  Conceal = { fg = "#fe8019" },
  pandocDelimitedCodeBlock = { fg = "#b9f27c" },
  pandocNoFormatted = { fg = "#CF4F6D" },

  -- Highligh Folding
  Folded = { fg = "#96e2f0", bg = nil },

  -- Highligh for search
  HlSearchFloat = { fg = "#2e222f", bg = "#fb6b1d" },
  HlSearchLens = { fg = "#fb6b1d", bg = nil, bold = true, italic = true },

  -- Whichkey colors
  WhichKeyDesc = { link = "Keyword" },
  WhichKeyGroup = { link = "Identifier" },

  -- Qf colors
  qfPath = { fg = "#FF5C8F" },
  qfPosition = { fg = "#64657E" },
  QuickFixLine = { fg = nil },

  -- Color column
  ColorColumn = { bg = nil },

  -- Curosr Line Color
  Cursorline = { bg = nil },
  Beacon = { bg = "white" },

  -- Transparent background floating
  NormalFloat = { bg = "#10081D" },
  CmpDocWin = { bg = nil },
  Pmenu = { bg = nil },
  PmenuSbar = { bg = nil },
  PmenuThumb = { bg = "white" },
  PmenuSel = { bold = true, fg = "#24283b", bg = "#b9f27c" },
  CmpItemAbbrMatchFuzzyDefault = { fg = "#b9f27c" },
  CmpItemAbbrMatch = { fg = "orange" },
  CmpItemAbbr = { link = "Comment" },

  -- Match brackets colors
  MatchParen = { italic = true },

  -- Galaxyline
  StatusLine = { bg = nil },
  StatusLineNC = { bg = nil },

  -- Signature help
  LspSignatureActiveParameter = { fg = "#f79617" },

  -- Visual mode
  Visual = { bg = "#333954" },
  Search = { bg = "#333954" },
}

for group, options in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, options)
end
