-- Don't require none-ls at the top level to avoid circular dependencies
-- It will be required in the config function instead
local null_ls, helpers

-- Function to build sources (called after none-ls is loaded)
local function get_sources()
  -- none-ls uses "null-ls" as the internal module name
  null_ls = require("null-ls")
  helpers = require("null-ls.helpers")
  
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

  return {

  -- Markdown
  -- b.formatting.markdownlint.with {
  --   filetypes = { "markdown", "markdown.pandoc" },
  -- },
  -- b.diagnostics.markdownlint.with {
  --   filetypes = { "markdown", "markdown.pandoc" },
  -- },

  -- JS html css stuff
  b.formatting.prettierd.with {
    filetypes = {
      "html",
      "json",
      -- "markdown.pandoc",
      -- "markdown",
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
  -- b.code_actions.eslint_d.with {
  --   filetypes = { "html", "json", "markdown.pandoc", "markdown", "scss", "css", "javascript", "javascriptreact", "vue" },
  -- },
  -- b.diagnostics.eslint.with {
  --   command = "eslint",
  -- },
  -- b.diagnostics.stylelint.with {
  --   filetypes = { "scss", "less", "css", "sass", "vue" },
  -- },

  -- R code
  b.formatting.styler,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Golang
  b.formatting.gofmt,

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
end

local M = {}

M.config = function(on_attach)
  local sources = get_sources()
  null_ls.setup({
    sources = sources,
    on_attach = on_attach,
  })
end

return M
