vim.o.list = true
-- vim.opt.listchars:append "eol:↴"

-- indent-blankline v3 API
require("ibl").setup {
  indent = {
    char = "│",
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = { "NvimTree", "help", "lazy", "mason", "neo-tree" },
  },
}
