require("utils.augroup").define_augroups({
	_close_qf = { { "BufEnter", "<buffer>", "if winnr('$') < 2| q | endif" } },
})
