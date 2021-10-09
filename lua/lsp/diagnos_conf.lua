local function lspSymbol(name, icon)
  vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, texthl = "Diagnostic" .. name })
end

lspSymbol("Error", "")
lspSymbol("Hint", "")
lspSymbol("Info", "")
lspSymbol("Warn", "")

local diagnostic_cfg = {
  underline = true,
  virtual_text = { spacing = 3, prefix = "" },
  signs = true,
  update_in_insert = false,
  severity_sort = true,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  diagnostic_cfg
)
