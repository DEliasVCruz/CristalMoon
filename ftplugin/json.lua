local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

lsp.jsonls.setup({
	cmd = { "vscode-json-languageserver", "--stdio" },
	init_options = {
		provideFormatter = true,
	},
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
			end,
		},
	},
	on_attach = require("lsp").common_on_attach,
})
