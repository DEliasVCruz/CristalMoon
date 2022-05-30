vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  use_treesitter = true,
  show_current_context = true,
  max_indent_increase = 1,
  show_first_indent_level = false,
  show_end_of_line = true,
  context_patterns = {
    "class",
    "function",
    "method",
    "for_statement",
    "try_statement",
    "except_clause",
    "finally_clause",
    "while_statement",
    "if_statement",
    "with_statement",
  },
  filetype_exclude = { "NvimTree", "help", "packer", "lsp-installer" },
}
