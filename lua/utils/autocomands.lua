local func = require "utils.augroup"

func.define_augroups {
  _general_settings = {
    { "TextYankPost", "*", "lua require('vim.highlight').on_yank({higroup = 'YankHighlight', timeout = 200})" },
    { "FileType", "qf", "set nobuflisted" },
    { "BufWritePre", "*", "lua require('utils.functions').mkdir()" },
    { "VimResized", "*", "wincmd =" },
  },
  _formatting = {
    { "BufWritePost", "*", "lua require('utils.functions').trim_whitespaces()" },
  },
}
