-- Java filetype plugin
-- nvim-java handles jdtls setup automatically
-- This file is intentionally minimal - nvim-java does all the work

-- Just verify the plugin is loaded
if not pcall(require, "java") then
  vim.notify("nvim-java not found - run :Lazy sync", vim.log.levels.ERROR)
end

