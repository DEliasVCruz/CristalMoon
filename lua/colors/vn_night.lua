require("vn-night").setup()

local highlights = {
  -- Highlight Yank
  YankHighlight = { bold = true, fg = "white", bg = "#f79617" },

  -- Fidget Spinner
  --[[ FidgetTitle = { bg = "red", fg = "orange" },
  FidgetTask = { bg = "red", fg = "orange"}, ]]

  -- Basic colors
  -- TSField = { fg = "#96CDFB" },
  String = { fg = "#b9f27c" },
  TSField = { fg = "#89DCEB" },
  -- TSField = { fg = "aqua" }, -- Needs more contrast

  -- -- Transperency
  SignColumn = { fg = "#E3E4FD", bg = nil },
  -- CursorLineNR = { bold = true, fg = "white", bg = "#4a358c" },
  CursorLineNR = { bold = true, fg = "white", bg = "#ea9999" },
  -- #dadbec
  Normal = { fg = "#E3E4FD", bg = "#2B2C47" },
  -- Normal = { fg = "#E3E4FD", bg = nil },
  LineNr = { link = "Comment" },

  -- Buffer Line
  BufferLineFill = { bg = "#202135" },

  -- Markdown support
  Conceal = { fg = "#fe8019" },
  pandocDelimitedCodeBlock = { fg = "#b9f27c" },
  pandocNoFormatted = { fg = "#CF4F6D" },
  pandocBlockquote = { fg = "LightGray" },

  -- Highligh Folding
  Folded = { fg = "#96e2f0", bg = nil },

  -- Highligh for search
  HlSearchFloat = { fg = "#2e222f", bg = "#fb6b1d" },
  HlSearchLens = { fg = "#fb6b1d", bg = nil, bold = true, italic = true },

  -- Whichkey colors
  WhichKeyDesc = { fg = "#f7454b" },
  WhichKeyGroup = { fg = "#34b4fe" },

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
  NormalFloat = { bg = "#222338" },
  CmpDocWin = { bold = false, bg = "#141533" },
  Pmenu = { bg = "#222338" },
  PmenuSbar = { bg = nil },
  PmenuThumb = { bg = "white" },
  PmenuSel = { bold = true, fg = "#24283b", bg = "#b9f27c" },
  CmpItemAbbrMatchFuzzyDefault = { fg = "#b9f27c" },
  CmpItemAbbrMatch = { fg = "orange" },
  -- CmpItemAbbr = { link = "Comment" },
  CmpItemAbbr = { fg = "white" },
  CmpItemAbbrDeprecated = { bg = nil, strikethrough = true, fg = "#808080" },
  CmpItemMenuDefault = { link = "Comment" },

  NeoTreeNormalNC = { bg = "#222338" },
  -- Python highlights
  -- pythonTSComment = { bg = nil, fg = "#6EA8B7" },

  -- CmpItemKindVariable = { link = "TSVariable" },
  -- CmpItemKindVariable = { fg = "#96CDFB" },
  -- CmpItemKindVariable = { fg = "#9CDCFE" },
  CmpItemKindVariable = { fg = "aqua" },
  -- CmpItemKindText = { fg = "#9CDCFE", bg = nil },
  CmpItemKindText = { fg = "DarkGray", bg = nil },
  CmpItemKindFunction = { link = "TSKeywordFunction" },
  CmpItemKindSnippet = { fg = "#fb6b1d" },
  CmpItemKindKeyword = { fg = "yellow" },

  -- Match brackets colors
  MatchParen = { italic = true },

  -- Galaxyline
  -- StatusLine = { bg = nil },
  -- StatusLineNC = { bg = nil },
  StatusLine = { bg = "#222338" },
  StatusLineNC = { bg = "#222338" },

  -- Signature help
  LspSignatureActiveParameter = { fg = "#f79617" },

  -- Visual mode
  Visual = { bg = "#333954" },
  Search = { bg = "#333954" },

  -- Beacon/Specs cursor jump
  SpecsCursorJump = { bg = "#E3E4FD" },

  -- Special character diferential
  SpecialKey = { fg = "#61AFEF" },
  SpecialKeyWin = { fg = "#3B4048" },

  -- Scrollbar highlights
  ScrollbarHandle = { fg = nil, bg = "#EEEADE" },
  ScrollbarSearchHandle = { bold = true, fg = "#f79617", bg = "#EEEADE" },
  ScrollbarSearch = { bold = true, fg = "#f79617", bg = nil },
  ScrollbarErrorHandle = { bold = true, fg = "red", bg = "#EEEADE" },
  ScrollbarError = { bold = true, fg = "red", bg = nil },
  ScrollbarWarnHandle = { bold = true, fg = "DarkYellow", bg = "#EEEADE" },
  ScrollbarWarn = { bold = false, fg = "DarkYellow", bg = nil },
  ScrollbarInfoHandle = { bold = true, fg = "LightBlue", bg = "#EEEADE" },
  ScrollbarInfo = { bold = false, fg = "LightBlue", bg = nil },
  ScrollbarHintHandle = { bold = true, fg = "LightGrey", bg = "#EEEADE" },
  ScrollbarHint = { bold = false, fg = "LightGrey", bg = nil },

  Keyword = { fg = "DarkOrange" },
  Identifier = { fg = "white" },
  ["@property"] = { fg = "SkyBlue" },
  ["@namespace"] = { fg = "gray" },
  ["@parameter"] = { fg = "Magenta" },
  ["@field"] = { fg = "LightBlue" },
  ["@constant"] = { fg = "pink" },
  ["@function"] = { bg = nil },
  ["@variable"] = { fg = "white" },
  ["@function.call"] = { fg = "#feC34d" },
  ["@function.declaration"] = { fg = "#feC34d" },
  ["@lsp.type.variable"] = { fg = nil },
  ["@lsp.type.property"] = { fg = nil },

  ["@string.lua"] = { fg = "LightGray" },

  ["@variable.parameter.javascript"] = { fg = "Magenta" },
  ["@variable.builtin.javascript"] = { fg = "Gray" },
  ["@function.method.call.javascript"] = { link = "@function.call" },

  -- Semantic highlights of Javascript
  ["@lsp.typemod.variable.defaultLibrary.javascript"] = { link = "@variable.builtin.javascript" },
  ["@lsp.type.method.javascript"] = { link = "@function.method.call.javascript" },
  ["@lsp.type.property.javascript"] = { fg = "SkyBlue" },
  ["@lsp.type.parameter.javascript"] = { link = "@variable.parameter.javascript" },

  ["@type.builtin.java"] = { link = "Keyword" },
  -- ["@variable.parameter.java"] = { fg = "LightGray" },
  ["@keyword.operator.java"] = { link = "Keyword" },
  ["@keyword.exception.java"] = { fg = "#f7454b" },
  ["@variable.member.java"] = { fg = "SkyBlue" },
  ["@variable.builtin.java"] = { fg = "Magenta" },
  ["@constant.builtin.java"] = { fg = "Gray" },

  -- Semantic highlights of java
  ["@lsp.type.modifier.java"] = { link = "Keyword" },
  ["@lsp.type.method.java"] = { link = "@function.declaration" },
  -- ["@lsp.mod.declaration.java"] = { link = "Type" },
  ["@lsp.typemod.method.declaration.java"] = { link = "@function.call" },
  ["@lsp.typemod.variable.declaration.java"] = { link = "@variable" },
  ["@lsp.typemod.parameter.declaration.java"] = { link = "@variable" },
  ["@lsp.type.property.java"] = { link = "@variable.member.java" },
  ["@lsp.typemod.property.declaration.java"] = { link = "@variable.member.java" },
  ["@lsp.typemod.property.readonly.java"] = { fg = "Gray" },
  -- ["@lsp.type.parameter.java"] = { link = "@variable.parameter.java" },
  ["@lsp.type.class.java"] = { fg = "LightMagenta", bold = true },
  -- ["@lsp.type.class.java"] = { link = "Type" },
  -- ["@lsp.typemod.class.constructor.java"] = { link = "Type", bold = false },
  ["@lsp.typemod.class.constructor.java"] = { fg = "#E3E4FD" },

  -- Semantic highlights of golang
  ["@lsp.type.namespace.go"] = { fg = "Gray" },
  ["@lsp.type.parameter.go"] = { fg = "Magenta" },
  ["@lsp.type.variable.go"] = { fg = nil },
}

for group, options in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, options)
end

vim.o.winhighlight = "SpecialKey:SpecialKeyWin"
