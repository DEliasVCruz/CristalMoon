-- Configure htmldjango filetype to use HTML tree-sitter parser
-- This allows template files to get YAML and Liquid syntax highlighting

vim.treesitter.language.register("html", "htmldjango")

-- Disable auto-formatting on save for htmldjango files
-- HTML formatters break YAML frontmatter indentation

-- Try multiple approaches to disable formatting
vim.b.lsp_format_on_save = false
vim.b.disable_autoformat = true

-- Disable formatting for all LSP clients on this buffer
vim.api.nvim_create_autocmd("LspAttach", {
  buffer = 0,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
})

