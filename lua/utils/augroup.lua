local funcs = {}

function funcs.create_commands(table, group)
  for event, arguments in pairs(table) do
    local pattern = arguments[1]
    local command = arguments[2]
    vim.api.nvim_create_autocmd(event, { pattern = pattern, callback = command, group = group })
  end
end

return funcs
