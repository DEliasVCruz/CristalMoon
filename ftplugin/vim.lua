local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

lsp.vimls.setup {
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  on_attach = require("lsp").common_on_attach,
}
