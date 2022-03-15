-- Startup optimizations
require "impatient"
vim.g.did_load_filetypes = 1
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

-- Load core config
require "settings"
require "keymappings"
require "packer_compiled"
require "utils.autocomands"
