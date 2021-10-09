-- Options
vim.g["pandoc#syntax#conceal#urls"] = 1
vim.g["pandoc#syntax#style#use_definition_lists"] = 0
vim.o.conceallevel = 0 -- So that I can see `` in markdown files

-- Tabbing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Lsp
-- require("lspconfig").zk.setup({
-- filetypes = { "markdown", "markdown.pandoc" },
-- })

-- Formatting
require("utils.augroup").define_augroups {
  _formatting_lua = { { "BufWritePost", "*.md", "lua require('core.formatter').md()" } },
}

-- require("lsp.ltex")

-- Lsp
-- local status_ok, lsp = pcall(require, "lspconfig")
-- if not status_ok then
-- return
-- end

-- local markdownlint = {
-- LintCommand = "markdownlint --stdin",
-- lintStdin = true,
-- lintFormats = { "%f:%l:%c MD%n/%*[^ ] %m", "%f:%l MD%n/%*[^ ] %m" },
-- commands = {
-- command = "markdownlint",
-- arguments = { "--fix", "${INPUT}" },
-- },
-- }

-- lsp.efm.setup({
-- cmd = { "efm-langserver" },
-- on_attach = require("lsp").common_on_attach,
-- init_options = { documentFormatting = true, codeAction = false },
-- filetypes = { "markdown.pandoc", "markdown", "md" },
-- settings = {
-- rootMarkers = { ".git/" },
-- languages = {
-- ["markdown.pandoc"] = markdownlint,
-- markdown = markdownlint,
-- },
-- },
-- })
