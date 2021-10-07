local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
	return
end

bqf.setup({
	preview = {
		auto_preview = false,
		delay_syntax = 10,
		win_vheight = 10,
	},
})

-- Keybidings
vim.api.nvim_set_keymap("n", "<C-j>", ":cnext<CR>zzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":cprev<CR>zzzv", { noremap = true, silent = true })
