-- Set leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Add lines with enter
vim.api.nvim_set_keymap("n", "<Enter>", "o<ESC>", { noremap = false })

-- Command mode movement
vim.api.nvim_set_keymap("c", "<C-j>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-k>", "<Right>", { noremap = true })

-- Move lines up an down in varous modes without deliting and pasting
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })

-- Avoid entering Ex mode and disable s
vim.api.nvim_set_keymap("n", "Q", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "s", "<NOP>", { noremap = true, silent = true })

-- Keep J centered
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })

-- Jumplist mutations
vim.api.nvim_set_keymap(
  "n",
  "k",
  [[(v:count > 2 ? "m'" . v:count : "") . 'k']],
  { expr = true, noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "j",
  [[(v:count > 2 ? "m'" . v:count : "") . 'j']],
  { expr = true, noremap = true, silent = true }
)

-- Center Scrolling
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>:keepjumps normal M<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>:keepjumps normal M<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<C-e>:keepjumps normal M<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-y>", "<C-y>:keepjumps normal M<cr>", { noremap = true, silent = true })

-- Back and forward full words with ctrl instead of mayus
vim.api.nvim_set_keymap("n", "<C-b>", "B", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>", "W", { noremap = true, silent = true })

-- Easy acces to comand mode
vim.api.nvim_set_keymap("n", "<C-Space>", ":", { noremap = true, silent = false })
