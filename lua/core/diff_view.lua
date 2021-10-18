-- Lua
local cb = require("diffview.config").diffview_callback

require("diffview").setup {
  diff_binaries = false, -- Show diffs for binaries
  enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true, -- Requires nvim-web-devicons
  icons = { -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left", -- One of 'left', 'right', 'top', 'bottom'
    width = 35, -- Only applies when position is 'left' or 'right'
    listing_style = "tree", -- One of 'list' or 'tree'
    tree_options = { -- Only applies when listing_style is 'tree'
      flatten_dirs = true,
      folder_statuses = "always",  -- One of 'never', 'only_folded' or 'always'.
    },
  },
  file_history_panel = {
    position = "bottom",
    height = 16,
    log_options = {
      max_count = 256, -- Limit the number of commits
      follow = true, -- Follow renames (only for single file)
      all = false, -- Include all refs under 'refs/' including HEAD
      merges = false, -- List only merge commits
      no_merges = false, -- List no merge commits
      reverse = false, -- List commits in reverse order
    },
  },
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"] = cb "select_next_entry", -- Open the diff for the next file
      ["<C-t>"] = cb "select_prev_entry", -- Open the diff for the previous file
      ["<C-w><C-v>"] = cb "goto_file_split", -- Open the file in a new split
      ["<C-w><C-f>"] = cb "focus_files", -- Bring focus to the files panel
      ["<C-w><C-e>"] = cb "toggle_files", -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb "next_entry", -- Bring the cursor to the next file entry
      ["k"] = cb "prev_entry", -- Bring the cursor to the previous file entry.
      ["<cr>"] = cb "select_entry", -- Open the diff for the selected entry.
      ["o"] = cb "focus_entry",
      ["s"] = cb "toggle_stage_entry", -- Stage / unstage the selected entry.
      ["S"] = cb "stage_all", -- Stage all entries.
      ["U"] = cb "unstage_all", -- Unstage all entries.
      ["X"] = cb "restore_entry", -- Restore entry to the state on the left side.
      ["R"] = cb "refresh_files", -- Update stats and entries in the file list.
      ["<tab>"] = cb "select_next_entry",
      ["<C-t>"] = cb "select_prev_entry",
      ["gf"] = cb "goto_file",
      ["<C-v>"] = cb "goto_file_split",
      ["i"] = cb "listing_style", -- Toggle between 'list' and 'tree' views
      ["f"] = cb "toggle_flatten_dirs", -- Flatten empty subdirectories in tree listing style.
      ["<C-w><C-f>"] = cb "focus_files",
      ["<C-w><C-e>"] = cb "toggle_files",
    },
    file_history_panel = {
      ["g!"] = cb "options", -- Open the option panel
      ["gv"] = cb "open_in_diffview", -- Open the entry under the cursor in a diffview
      ["y"] = cb "copy_hash", -- Copy the commit hash of the entry under the cursor
      ["zo"] = cb "open_all_folds",
      ["zc"] = cb "close_all_folds",
      ["j"] = cb "next_entry",
      ["k"] = cb "prev_entry",
      ["<cr>"] = cb "select_entry",
      ["o"] = cb "focus_entry",
      ["<tab>"] = cb "select_next_entry",
      ["<C-t>"] = cb "select_prev_entry",
      ["gf"] = cb "goto_file",
      ["<C-v>"] = cb "goto_file_split",
      ["<C-w><C-f>"] = cb "focus_files",
      ["<C-w><C-e>"] = cb "toggle_files",
    },
    option_panel = {
      ["<tab>"] = cb "select",
      ["q"] = cb "close",
    },
  },
}
