-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Cloning lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("lazy.nvim cloned successfully.")
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy.nvim
return {
  defaults = {
    lazy = false, -- plugins are not lazy-loaded by default
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
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
      },
    },
  },
  ui = {
    border = "single",
  },
  git = {
    timeout = 600, -- 10 minutes
  },
}

