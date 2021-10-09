local catpuccino = require("catppuccino")
catpuccino.setup({
	colorscheme = "neon_latte",
	transparency = true,
	term_colors = true,
	integrations = {
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
		},
		which_key = true,
		markdown = true,
		hop = false,
	},
})
