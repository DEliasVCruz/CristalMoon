-- Set leader key BEFORE loading lazy.nvim
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
local lazy_config = require("core.lazy")
require("lazy").setup("plugins", lazy_config)

-- Basic global options
vim.g.cursorhold_updatetime = 100

-- Setup clipboard manager
vim.g.clipboard = {
  name = "xsel",
  copy = {
    ["+"] = "xsel --nodetach -i -b",
    ["*"] = "xsel --nodetach -i -p",
  },
  paste = {
    ["+"] = "xsel -o -b",
    ["*"] = "xsel -o -p",
  },
  cache_enabled = 1,
}

vim.filetype.add({
  extension = {
    md = "markdown.pandoc",
  },
})

-- Load core config
require("settings")
require("keymappings")
require("utils.autocomands")
