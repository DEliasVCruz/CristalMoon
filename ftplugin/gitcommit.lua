vim.opt_local.textwidth = 72
vim.o.laststatus = 1
vim.o.number = false
vim.o.relativenumber = false
vim.api.nvim_buf_set_keymap(0, "n", "q", ":q!<cr>", { silent = true })
