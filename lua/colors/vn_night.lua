require("vn-night").setup()

-- Transperency
vim.cmd [[hi SignColumn guibg=none]]
vim.cmd [[hi CursorLineNR guibg=None]]
vim.cmd [[highlight Normal guibg=none]]

-- Highlight Yank
vim.cmd [[hi YankHighlight guibg=#b47109]]

-- Markdown support
vim.cmd [[hi Conceal guifg=#fe8019]]
-- vim.cmd([[hi Conceal guifg=#a884f3]])
-- vim.cmd([[hi default link Conceal markdownRule]])
-- vim.cmd([[hi pandocDelimitedCodeBlock guifg=#a884f3]])
vim.cmd [[hi pandocDelimitedCodeBlock gui=bold guibg=#333333 guifg=#84CE5C]]
vim.cmd [[hi pandocNoFormatted guibg=#333333 guifg=#CF4F6D]]

-- Highligh Folding
vim.cmd [[highlight Folded guibg=none]]

-- Highligh for search
vim.cmd [[hi HlSearchFloat guifg=#2e222f guibg=#fb6b1d]]
vim.cmd [[hi HlSearchLens gui=bolditalic guifg=#fb6b1d guibg=NONE]]

-- Folds
vim.cmd [[hi Folded guifg=#96e2f0 guibg=NONE]]

-- Whichkey colors
vim.cmd [[highlight WhichKeyFloat guibg=#10081D]]
vim.cmd [[hi default link WhichKeyDesc Keyword]]
vim.cmd [[hi default link WhichKeyGroup Identifier]]

-- Qf colors
vim.cmd [[highlight qfPath guifg=#FF5C8F]]
vim.cmd [[highlight qfPosition guifg=#64657E]]
vim.cmd [[highlight QuickFixLine gui=bold guifg=none]]

-- Color column
vim.cmd [[highlight ColorColumn guibg=#211337]]

-- Curosr Line Color
vim.cmd [[highlight Cursorline guibg=#211337]]
