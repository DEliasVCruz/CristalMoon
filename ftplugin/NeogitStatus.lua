vim.api.nvim_buf_set_keymap(0, "n", "q", ":q!<cr>", { silent = true })
vim.o.list = false
vim.o.colorcolumn = ""
vim.cmd "wincmd H"
vim.o.buflisted = false
