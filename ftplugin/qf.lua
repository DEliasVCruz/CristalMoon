vim.o.colorcolumn = ""
vim.o.signcolumn = "yes:1"
vim.o.number = false
vim.o.buflisted = false

--[[ vim.keymap.set("n", "<leader>ar", function()
  require("replacer").run()
end, { silent = true, buffer = true }) ]]
vim.keymap.set("n", "q", ":q!<cr>", { silent = true, buffer = true })
