vim.o.list = true
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  use_treesitter = false,
  show_current_context = true,
  max_indent_increase = 1,
  show_first_indent_level = false,
  show_end_of_line = true,
  filetype_exclude = { "NvimTree", "help", "packer", "lsp-installer" },
}
