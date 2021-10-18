vim.opt_local.textwidth = 72
vim.opt.laststatus = 1
vim.opt.number = false
vim.opt.relativenumber = false
vim.api.nvim_buf_set_keymap(0, "n", "q", ":q!<cr>", { silent = true })
