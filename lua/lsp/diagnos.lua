local M = {}

M.config = function()
  local function lspSymbol(name, icon)
    vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, texthl = "DiagnosticSign" .. name })
  end

  lspSymbol("Error", " ")
  lspSymbol("Hint", " ")
  lspSymbol("Info", " ")
  lspSymbol("Warn", " ")

  local diagnostic_cfg = {
    underline = true,
    virtual_text = { spacing = 3, prefix = "" },
    -- virtual_text = false,
    signs = true,
    update_in_insert = false,
    severity_sort = true,
  }

  vim.diagnostic.config(diagnostic_cfg)
end

return M
