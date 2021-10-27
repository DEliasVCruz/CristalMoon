local M = {}

M.config = function()
  local status_ok, preview = pcall(require, "goto-preview")
  if not status_ok then
    return
  end

  preview.setup {
    width = 80, -- Width of the floating window
    height = 12, -- Height of the floating window
    default_mappings = false, -- Bind default mappings
    debug = false, -- Print debug information
    opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
    post_open_hook = function()
      vim.cmd "set nonumber norelativenumber scrolloff=0"
      vim.cmd "nnoremap q :q!<cr>"
      vim.defer_fn(function()
        vim.cmd [[ normal zt ]]
      end, 1)
    end,
  }
end

return M
