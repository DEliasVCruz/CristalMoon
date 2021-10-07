local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.cssls.setup({
	capabilities = capabilities,
	cmd = { "css-languageserver", "--stdio" },
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
	on_attach = require("lsp").common_on_attach,
})

vim.cmd("setl ts=2 sw=2")

require("lsp.emmet_lsp")
