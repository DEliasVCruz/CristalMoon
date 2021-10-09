local M = {}

M.setup = function()
  local g = vim.g

  g.nvim_tree_indent_markers = 1
  g.nvim_tree_hide_dotfiles = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_root_folder_modifier = ":t"

  g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }

  vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  }
end

M.config = function()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end
  local tree_cb = require("nvim-tree.config").nvim_tree_callback
  nvim_tree.setup {
    auto_close = true,
    hijack_cursor = true,
    update_cwd = true,
    lsp_diagnostics = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    view = {
      { key = "v", cb = tree_cb "vsplit" },
      { key = "s", cb = tree_cb "split" },
    },
  }
end

return M
