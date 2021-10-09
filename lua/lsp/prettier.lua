local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

lsp.efm.setup {
  cmd = { "efm-langserver" },
  on_attach = require("lsp").common_on_attach,
  init_options = { documentFormatting = true, codeAction = false },
  filetypes = { "markdown", "markdown.pandoc", "css", "javascript", "html", "scss", "json" },
  settings = {
    rootMarkers = { ".git/", "requirements.txt" },
    languages = {
      ["markdown.pandoc"] = {
        formatCommand = "prettier --stdin-filepath ${INPUT}",
        formatStdin = true,
      },
    },
  },
}
