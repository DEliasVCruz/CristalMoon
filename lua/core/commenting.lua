local M = {}

M.config = function()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  comment.setup({
    ignore = '^$',
    mappings = {
      basic = false,
      extra = false,
      extended = false,
    }
  })

  end

return M
