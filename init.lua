-- Startup optimizations
local ok, _ = pcall(require, "impatient")
if not ok then
  require "plugins"
  require("packer").sync()
  require("packer").compile()
end

-- Basic global options
vim.g.cursorhold_updatetime = 100

-- Disable pluggins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "man",
  "tutor_mode_plugin",
  "matchit",
  "matchparen",
  "remote_plugins",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

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

vim.filetype.add {
  extension = {
    md = "markdown.pandoc",
  },
}

-- Load core config
require "settings"
require "keymappings"
require "packer_compiled"
require "utils.autocomands"
