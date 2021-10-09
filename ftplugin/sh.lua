local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Setup for the bash lsp
lsp.bashls.setup {
  cmd = { "bash-language-server", "start" },
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
  },
  on_attach = require("lsp").common_on_attach,
  filetypes = { "sh", "zsh" },
}

-- sh
local sh_arguments = {}

local shfmt = { formatCommand = "shfmt -ci -s -bn", formatStdin = true }

local shellcheck = {
  LintCommand = "shellcheck -f gcc -x",
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

table.insert(sh_arguments, shellcheck)
table.insert(sh_arguments, shfmt)

lsp.efm.setup {
  cmd = { "efm-langserver" },
  on_attach = require("lsp").common_on_attach,
  init_options = { documentFormatting = true, codeAction = false },
  filetypes = { "sh", "zsh" },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      sh = sh_arguments,
    },
  },
}
