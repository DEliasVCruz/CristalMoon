local M = {}

M.setup = function()
	vim.g.gruvbox_flat_style = "dark"
	vim.g.gruvbox_sidebars = { "undotree", "diff", "terminal", "qf", "CHADTree" }
	vim.g.gruvbox_transparent = true
	vim.g.gruvbox_colors = {
		bg_visual = "#a96b2c",
		bg_sidebar = "#312c2c", -- Grey that blends
		-- bg_sidebar = "#1a1717", -- Golden dark
		-- bg_sidebar = "#262b22", -- Cool Green
	}
end

-- Set colorscheme
M.config = function()
	-- code
	-- vim.cmd([[colorscheme gruvbox-flat]])

	-- Transperency
	-- vim.cmd([[hi SignColumn guibg=none]])
	-- vim.cmd([[hi CursorLineNR guibg=None]])
	-- vim.cmd([[highlight Normal guibg=none]])

	vim.cmd([[highlight ColorColumn ctermbg=0 guibg=grey]])
	vim.cmd([[highlight LineNr guifg=#5eacd3]])
	vim.cmd([[hi TelescopeBorder guifg=#5eacd]])

	-- Highligh Folding
	vim.cmd([[highlight Folded guibg=none]])

	-- Highlight Yank
	vim.cmd([[hi YankHighlight guibg=#b47109]])

	-- Bufferline selection
	-- vim.cmd([[highlight TabLineSel guibg=#e78a4e]])

	-- Gitblame colors
	vim.cmd([[hi default link GitSignsCurrentLineBlame SpecialComment]])

	-- Match brackets colors
	vim.cmd([[hi MatchParen cterm=italic gui=italic]])

	-- Quickscope highlight
	vim.cmd([[hi QuickScopePrimary guifg='#afff5f' gui=bold]])
	vim.cmd([[hi QuickScopeSecondary guifg='#5fffff' gui=bold]])

	-- Markdown support
	vim.cmd([[hi Conceal guifg=#fe8019]])
end

return M
