local remap_silent = { noremap = true, silent = true }
local remap_silent_exp = { noremap = true, silent = true, expr = true }

-- Set leader key
vim.keymap.set("n", "<Space>", "<NOP>", remap_silent)
vim.g.mapleader = " "

-- Add lines with enter
vim.keymap.set("n", "<Enter>", "o<ESC>", { noremap = false })

-- Command mode movement
vim.keymap.set("c", "<C-j>", "<left>", { noremap = true })
vim.keymap.set("c", "<C-k>", "<right>", { noremap = true })
vim.keymap.set("c", "<C-f>", function()
  require("cmdbuf").split_open(vim.o.cmdwinheight, { line = vim.fn.getcmdline(), column = vim.fn.getcmdpos() })
  vim.api.nvim_input "<C-c>"
end, { noremap = true })

-- Move lines up an down in varous modes without deliting and pasting
vim.keymap.set("n", "<A-p>", ":m .-2<CR>==", remap_silent)
vim.keymap.set("n", "<A-n>", ":m .+1<CR>==", remap_silent)
vim.keymap.set("v", "<A-p>", ":m '<-2<CR>gv=gv", remap_silent)
vim.keymap.set("v", "<A-n>", ":m '>+1<CR>gv=gv", remap_silent)

-- Avoid entering Ex mode and disable s
vim.keymap.set("n", "Q", "<NOP>", remap_silent)

-- Keep J centered
vim.keymap.set("n", "J", "mzJ`z", remap_silent)

-- Keybidings
vim.keymap.set("n", "<C-j>", ":cnext<CR>zzzv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":cprev<CR>zzzv", { noremap = true, silent = true })

-- Jumplist mutations
vim.keymap.set("n", "j", function()
  return require("utils.functions").jump_behaviour "j"
end, remap_silent_exp)
vim.keymap.set("n", "k", function()
  return require("utils.functions").jump_behaviour "k"
end, remap_silent_exp)

-- Scrolling
vim.keymap.set("n", "<C-d>", "<C-d>:keepjumps normal M<cr>", remap_silent)
vim.keymap.set("n", "<C-u>", "<C-u>:keepjumps normal M<cr>", remap_silent)
vim.keymap.set("n", "<C-e>", "<C-e>:keepjumps normal M<cr>", remap_silent)
vim.keymap.set("n", "<C-y>", "<C-y>:keepjumps normal M<cr>", remap_silent)
vim.keymap.set("n", "<A-l>", "zL", remap_silent)
vim.keymap.set("n", "<A-h>", "zH", remap_silent)

-- Back and forward full words with ctrl instead of mayus
vim.keymap.set("n", "<C-b>", "B", remap_silent)
vim.keymap.set("n", "<C-w>", "W", remap_silent)

-- Easy acces to comand mode
vim.keymap.set("n", "<C-Space>", ":", { noremap = true, silent = false })

-- General dial keymaps
vim.keymap.set("n", "<leader>adf", function()
  return require("dial.map").inc_normal()
end, remap_silent_exp)
vim.keymap.set("n", "<leader>adb", function()
  return require("dial.map").dec_normal()
end, remap_silent_exp)

-- Lightspeed mappings
vim.keymap.set({ "v", "n" }, "<leader>jd", "<Plug>Lightspeed_s", { noremap = false, silent = true })
vim.keymap.set({ "v", "n" }, "<leader>jo", "<Plug>Lightspeed_S", { noremap = false, silent = true })

-- Visual begining mappings
vim.keymap.set("v", "v", "o<esc>", remap_silent)
vim.keymap.set("v", "V", "o<esc>", remap_silent)

-- Replace motions
vim.keymap.set("n", "s", function()
  require("substitute").operator()
end, remap_silent)
vim.keymap.set("n", "ss", function()
  require("substitute").line()
end, remap_silent)
vim.keymap.set("n", "S", function()
  require("substitute").eol()
end, remap_silent)

-- Yank not move
-- TODO: This can be made better with mode()
vim.schedule(function()
  vim.keymap.set("v", "y", "oy", remap_silent)
end)

-- vim.keymap.set()
vim.keymap.set("n", "sa", function()
  return require("core.surround").operator "add"
end, { expr = true, noremap = true, silent = true })

vim.keymap.set("n", "sd", function()
  return require("core.surround").operator "delete" .. " "
end, { expr = true, noremap = true, silent = true })

vim.keymap.set("n", "sr", function()
  return require("core.surround").operator "replace" .. " "
end, { expr = true, noremap = true, silent = true })

vim.keymap.set("n", "sh", function()
  return require("core.surround").operator "highlight" .. " "
end, { expr = true, noremap = true, silent = true })
