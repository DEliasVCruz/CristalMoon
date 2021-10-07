local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

lsp.tsserver.setup({
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	on_attach = require("lsp").tsserver_on_attach,
	-- This makes sure tsserver is not used for formatting (I prefer prettier)
	-- on_attach = require'lsp'.common_on_attach,
	root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	settings = { documentFormatting = false },
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = { spacing = 0, prefix = "" },
			signs = true,
			underline = true,
			update_in_insert = false,
		}),
	},
})

-- Tabbing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- TODO add the extra config from LunarVim
