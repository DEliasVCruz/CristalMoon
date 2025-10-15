-- Async config of filetype and shada
vim.defer_fn(function()
  vim.cmd [[
    if &ft == "lazy" 
      echo "" 
    else 
      silent! e %
    endif
  ]]
end, 10)
