local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- npm i -g pyright
lsp.pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	on_attach = require("lsp").common_on_attach,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
			disableOrganizeImports = true,
		},
	},
})

local python_arguments = {}

local flake8 = {
	LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
}

local black = { formatCommand = "black --quiet -", formatStdin = true }

local isort = { formatCommand = "isort --quiet --stdout -", formatStdin = true }

local autoimport = { formatCommand = "autoimport  -", formatStdin = true }

local mypy = {
	lintCommand = "mypy",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

table.insert(python_arguments, flake8)
table.insert(python_arguments, autoimport)
table.insert(python_arguments, isort)
table.insert(python_arguments, black)
table.insert(python_arguments, mypy)

lsp.efm.setup({
	cmd = { "efm-langserver" },
	on_attach = require("lsp").common_on_attach,
	init_options = { documentFormatting = true, codeAction = false },
	filetypes = { "python" },
	settings = {
		rootMarkers = { ".git/", "requirements.txt" },
		languages = {
			python = python_arguments,
		},
	},
})
