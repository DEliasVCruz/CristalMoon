-- Configure htmlliquid filetype to use HTML parser and settings
-- This is for .11ty.html files with YAML frontmatter and Liquid templates

-- Set the treesitter parser to HTML
vim.treesitter.language.register("html", "htmlliquid")

-- Inherit HTML settings
vim.bo.commentstring = "<!-- %s -->"
vim.bo.indentexpr = "GetHTMLIndent()"

-- Set syntax to html as fallback for non-treesitter features
vim.cmd("runtime! syntax/html.vim")

-- Disable auto-formatting on save for htmlliquid files
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

