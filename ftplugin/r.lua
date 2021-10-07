local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

lsp.r_language_server.setup({
	cmd = { "R", "--slave", "-e", "languageserver::run()" },
	filetypes = { "r", "rmd" },
	log_level = 2,
	on_attach = require("lsp").common_on_attach,
})
