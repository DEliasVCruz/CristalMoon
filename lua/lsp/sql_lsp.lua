require'lspconfig'.sqls.setup{
  cmd = {"/usr/bin/sqls", "-config", "/home/danielv/.config/sqls/config.yml"},
  filetypes = { "sql", "mysql" },
  on_attach = require'lsp'.common_on_attach
}
