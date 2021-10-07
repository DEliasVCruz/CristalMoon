local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- TODO try rust tools more comprehensive setup
lsp.rust_analyzer.setup({
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {},
	},
	on_attach = require("lsp").common_on_attach,
})
