vim.filetype.add {
  extension = {
    -- Detect .11ty.html files as htmlliquid with Liquid and YAML support
    ["11ty.html"] = "htmlliquid",
  },
  pattern = {
    -- HTML files in templates or _includes directories (Eleventy templates)
    -- These patterns are checked first, before the generic src pattern
    [".*/templates/.*%.html$"] = "htmlliquid",
    [".*/_includes/.*%.html$"] = "htmlliquid",
    [".*/src/templates/.*%.html$"] = "htmlliquid",
  },
}
