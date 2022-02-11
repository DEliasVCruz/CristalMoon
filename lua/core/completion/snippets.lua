local present, luasnip = pcall(require, "luasnip")
if not present then
  return
end

luasnip.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}
require("luasnip/loaders/from_vscode").load()

-- Snippet Expansion
vim.keymap.set("i", "<C-l>", "<cmd>lua require'luasnip'.expand_or_jump()<cr>", { noremap = true })
vim.keymap.set("i", "<C-t>", "<cmd>lua require'luasnip'.jump(-1)<cr>", { noremap = true })
