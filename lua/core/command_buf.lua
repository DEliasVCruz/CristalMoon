local M = {}

local function cmdbuf()
  vim.keymap.set("n", "q", "<cmd>quit<CR>", { noremap = true, nowait = true, buffer = true })
  vim.keymap.set("n", "dd", function()
    require("cmdbuf").delete()
  end, { noremap = true, buffer = true })
end

M.config = function()
  local _command_buf = vim.api.nvim_create_augroup("CmdBufSetting", { clear = true })
  local settings = {
    ["User"] = {
      "CmdbufNew",
      function()
        cmdbuf()
      end,
    },
  }

  require("utils.augroup").create_commands(settings, _command_buf)
end

return M
