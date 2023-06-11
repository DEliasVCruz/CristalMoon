vim.opt_local.expandtab = false

local highlights = {
  Keyword = { fg = "DarkOrange" },
  Identifier = { fg = "white" },
  ["@parameter"] = { fg = "SkyBlue" },
  ["@namespace"] = { fg = "gray" },
  ["@property"] = { fg = "Magenta" },
  ["@field"] = { fg = "LightBlue" },
}

for group, options in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, options)
end
