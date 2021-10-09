-- Formatting
require("utils.augroup").define_augroups {
  _formatting_lua = { { "BufWritePost", "*.lua", "lua require('core.formatter').lua()" } },
}

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
