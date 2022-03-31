local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- Treesitter Highlihgt module setting
local default = {
  ignore_install = { "markdown", "phpdoc" },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>ai",
      node_incremental = "<C-k>",
      scope_incremental = "<leader>s",
      node_decremental = "<C-j>",
    },
  },
}

local M = {}
M.config = function()
  treesitter_configs.setup(default)
end

return M
