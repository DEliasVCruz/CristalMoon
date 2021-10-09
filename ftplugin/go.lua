local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

lsp.gopls.setup {
  cmd = { "gopls", "serve" },
  settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
  root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
  init_options = { usePlaceholders = true, completeUnimported = true },
  on_attach = require("lsp").common_on_attach,
}

vim.opt_local.expandtab = false
