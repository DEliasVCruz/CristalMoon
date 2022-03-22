vim.opt.colorcolumn = ""
vim.opt.signcolumn = "yes:1"
vim.opt.number = false
vim.opt.buflisted = false

--[[ vim.keymap.set("n", "<leader>ar", function()
  require("replacer").run()
end, { silent = true, buffer = true }) ]]
vim.keymap.set("n", "q", ":q!<cr>", { silent = true, buffer = true })
