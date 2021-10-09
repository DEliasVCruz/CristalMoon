local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

Floaded = {}
local M = {}

-- Lua
M.lua = function()
  -- Config for the nvim formatter
  if not Floaded["lua"] then
    local lua = {
      lua = {
        -- stylua
        function()
          return {
            exe = "stylua",
            args = { "-" },
            stdin = true,
          }
        end,
      },
    }
    formatter.setup { logging = false, filetype = lua }
    Floaded = { lua = true }
  end
  vim.cmd "silent FormatWrite"
end

-- Markdown
M.md = function()
  -- Config for the nvim formatter
  if not Floaded["md"] then
    local markdown = {
      ["markdown.pandoc"] = {
        -- Prettier
        function()
          return {
            exe = "prettierd",
            args = { vim.api.nvim_buf_get_name(0) },
            stdin = true,
          }
        end,
      },
    }
    formatter.setup { logging = false, filetype = markdown }
    Floaded = { md = true }
  end
  vim.cmd "silent FormatWrite"
end

return M
