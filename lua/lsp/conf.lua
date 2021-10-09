local M = {}
-- Async config of filetype and shada
M.setup = function()
  vim.defer_fn(function()
    vim.cmd [[
                    if &ft == "packer" | echo "" | else | silent! e %
                ]]
  end, 10)
end
return M
