local M = {}

M.config = function()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    return
  end
  gitsigns.setup {
    signs = {
      -- TODO add hl to colorscheme
      add = {
        text = "▎",
      },
      change = {
        text = "▎",
      },
      delete = {
        text = "契",
      },
      topdelete = {
        text = "契",
      },
      changedelete = {
        text = "▎",
      },
    },
    numhl = false,
    linehl = false,
    watch_gitdir = {
      follow_files = true,
      virt_text_pos = "overlay",
    },
    current_line_blame_opts = {
      delay = 0,
    },
    sign_priority = 5,
    update_debounce = 200,
    status_formatter = nil, -- Use default
  }
end

return M
