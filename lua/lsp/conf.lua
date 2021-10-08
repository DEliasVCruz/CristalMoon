local M = {}
-- Async config of filetype and shada
M.setup = function()
	local func = require("utils.augroup")

	func.define_augroups({
		_general_settings = {
			{ "FileType", "*", "lua require('utils.ft').do_filetype(vim.fn.expand(\"<amatch>\"))" },
		},
	})
	vim.defer_fn(function()
		vim.cmd([[
                    if &ft == "packer" | echo "" | else | silent! e %
                ]])
	end, 10)
end
return M
