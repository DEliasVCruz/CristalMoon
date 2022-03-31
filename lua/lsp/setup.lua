-- Async config of filetype and shada
vim.defer_fn(function()
  vim.cmd [[
              if &ft == "packer" | echo "" | else | silent! e %
          ]]
end, 10)
