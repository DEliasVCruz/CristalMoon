require("utils.augroup").define_augroups {
  _close_qf = { { "BufEnter", "<buffer>", "if winnr('$') < 2| q | endif" } },
}

vim.opt.colorcolumn = ""

vim.api.nvim_buf_set_keymap(0, "n", "<leader>ar", ':lua require("replacer").run()<cr>', { silent = true })
