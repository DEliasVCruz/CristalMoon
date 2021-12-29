local M = {}
M.config = function()
  -- Treesitter Highlihgt module setting
  Treesitter = {
    ensure_installed = {},
    ignore_install = {"markdown"},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
    autotag = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>as",
        node_incremental = "<C-k>",
        scope_incremental = "<leader>s",
        node_decremental = "<C-j>",
      },
    },
  }

  local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return
  end

  treesitter_configs.setup(Treesitter)
end

return M
