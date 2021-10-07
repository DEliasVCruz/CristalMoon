local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

lsp.texlab.setup({
	cmd = { "texlab" },
	filetypes = { "tex", "bib" },
	settings = {
		latex = {
			build = {
				onSave = true,
				forwardSearchAfter = true,
			},
			forwardSearch = {
				executable = "zathura",
			},
		},
	},
	on_attach = require("lsp").common_on_attach,
})
