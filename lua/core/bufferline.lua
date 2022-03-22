local M = {}

M.config = function()
  local status_ok, buffer = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  -- Buffer line setup
  buffer.setup {
    options = {
      close_command = nil,
      right_mouse_command = nil,
      left_mouse_command = nil,
      middle_mouse_command = nil,
      indicator_icon = "▎",
      modified_icon = "● ",
      left_trunc_marker = " ",
      right_trunc_marker = " ",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
          return ""
        end
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "EXPLORER",
          text_align = "center",
          padding = 1,
        },
        {
          filetype = "neo-tree",
          text = "EXPLORER",
          text_align = "center",
          padding = 1,
        },
        {
          filetype = "undotree",
          text = "HISTORY",
          text_align = "center",
          padding = 1,
        },
        {
          filetype = "packer",
          text = "",
          text_align = "center",
          padding = 1,
        },
        {
          filetype = "lsp-installer",
          text = "",
          text_align = "center",
          padding = 1,
        },
      },
      show_tab_indicators = false,
      show_close_icon = false,
      show_buffer_close_icons = false,
      persist_buffer_sort = false,
    },
  }

  -- Keymaps
end

return M
