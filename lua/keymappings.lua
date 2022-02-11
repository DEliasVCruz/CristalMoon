-- Set leader key
vim.keymap.set("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- Add lines with enter
vim.keymap.set("n", "<Enter>", "o<ESC>", { noremap = false })

-- Command mode movement
vim.keymap.set("c", "<C-j>", "<Left>", { noremap = true })
vim.keymap.set("c", "<C-k>", "<Right>", { noremap = true })

-- Move lines up an down in varous modes without deliting and pasting
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })

-- Avoid entering Ex mode and disable s
vim.keymap.set("n", "Q", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("n", "s", "<NOP>", { noremap = true, silent = true })

-- Keep J centered
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })

-- Jumplist mutations
vim.keymap.set(
  "n",
  "k",
  [[(v:count > 2 ? "m'" . v:count : "") . 'k']],
  { expr = true, noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "j",
  [[(v:count > 2 ? "m'" . v:count : "") . 'j']],
  { expr = true, noremap = true, silent = true }
)

-- Center Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>:keepjumps normal M<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>:keepjumps normal M<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-e>", "<C-e>:keepjumps normal M<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-y>", "<C-y>:keepjumps normal M<cr>", { noremap = true, silent = true })

-- Back and forward full words with ctrl instead of mayus
vim.keymap.set("n", "<C-b>", "B", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", "W", { noremap = true, silent = true })

-- Easy acces to comand mode
vim.keymap.set("n", "<C-Space>", ":", { noremap = true, silent = false })
