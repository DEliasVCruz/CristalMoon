local funcs = {}

function funcs.get_win_info()
	for _, info in ipairs(vim.fn.getwininfo()) do
		if info.quickfix == 1 then
			return info
		end
	end
	return nil
end
function funcs.quick_fix_toggle()
	if funcs.get_win_info() ~= nil then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end

return funcs
