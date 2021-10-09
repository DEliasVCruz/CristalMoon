--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- Setup for the html lsp
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

lsp.html.setup {
  capabilities = capabilities,
  cmd = { "vscode-html-languageserver", "--stdio" },
  filetypes = { "html" },
  on_attach = require("lsp").common_on_attach,
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
}

require "lsp.emmet_lsp"

vim.cmd "setl ts=2 sw=2"
