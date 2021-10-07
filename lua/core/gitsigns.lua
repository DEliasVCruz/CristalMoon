local M = {}

M.config = function()
	local status_ok, gitsigns = pcall(require, "gitsigns")
	if not status_ok then
		return
	end
	gitsigns.setup({
		signs = {
			-- TODO add hl to colorscheme
			add = {
				hl = "GitSignsAdd",
				text = "▎",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "▎",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "契",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = "契",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "▎",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		numhl = false,
		linehl = false,
		keymaps = nil,
		watch_gitdir = {
			interval = 100,
			follow_files = true,
		},
		current_line_blame_opts = {
			delay = 0,
		},
		sign_priority = 5,
		update_debounce = 200,
		status_formatter = nil, -- Use default
	})
end

return M
