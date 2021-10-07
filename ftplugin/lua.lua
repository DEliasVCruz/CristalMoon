local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local sumneko_root_path = "/home/danielv/Lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

-- Lsp config
lsp.sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = require("lsp").common_on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 1000,
			},
		},
	},
})

-- Formatting
require("utils.augroup").define_augroups({
	_formatting_lua = { { "BufWritePost", "*.lua", "lua require('core.formatter').lua()" } },
})
