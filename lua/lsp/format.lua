local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local helpers = require "null-ls.helpers"

local autoimportpy = {
  method = null_ls.methods.FORMATTING,
  filetypes = { "python" },
  generator = helpers.formatter_factory {
    command = "autoimport",
    args = { "-" },
    to_stdin = true,
  },
}

local b = null_ls.builtins

local sources = {

  -- Markdown
  b.formatting.markdownlint.with {
    filetypes = { "markdown", "markdown.pandoc" },
  },
  b.diagnostics.markdownlint.with {
    filetypes = { "markdown", "markdown.pandoc" },
  },

  -- JS html css stuff
  b.formatting.prettierd.with {
    filetypes = {
      "html",
      "json",
      "markdown.pandoc",
      "markdown",
      "scss",
      "css",
      "javascript",
      "typescript",
      "javascriptreact",
      "vue",
    },
  },
  b.formatting.stylelint.with {
    filetypes = { "scss", "less", "css", "sass", "vue" },
  },
  b.code_actions.eslint_d.with {
    filetypes = { "html", "json", "markdown.pandoc", "markdown", "scss", "css", "javascript", "javascriptreact", "vue" },
  },
  b.diagnostics.eslint.with {
    command = "eslint_d",
  },
  b.diagnostics.stylelint.with {
    filetypes = { "scss", "less", "css", "sass", "vue" },
  },

  -- R code
  b.formatting.styler,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt.with { filetypes = { "sh", "zsh", "bash" } },
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- Python
  b.diagnostics.flake8.with {
    args = { "--ignore=E501,W503,E203", "--stdin-display-name", "$FILENAME", "-" },
  },
  autoimportpy,
  b.formatting.isort,
  b.formatting.black,
}

local M = {}
M.config = function(on_attach)
  null_ls.setup {
    sources = sources,
    on_attach = on_attach,
  }
end

return M
