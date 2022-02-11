local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
  return
end

bqf.setup {
  preview = {
    auto_preview = false,
    delay_syntax = 10,
    win_vheight = 10,
  },
}

-- Keybidings
vim.keymap.set("n", "<C-j>", ":cnext<CR>zzzv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":cprev<CR>zzzv", { noremap = true, silent = true })
