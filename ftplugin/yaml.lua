local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

lsp.yamlls.setup {
  cmd = { "/usr/bin/yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  on_attach = require("lsp").common_on_attach,
}
vim.cmd "setl ts=2 sw=2 ts=2 ai et"
