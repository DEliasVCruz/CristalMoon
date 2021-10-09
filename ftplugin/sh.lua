-- sh
local sh_arguments = {}

local shfmt = { formatCommand = "shfmt -ci -s -bn", formatStdin = true }

local shellcheck = {
  LintCommand = "shellcheck -f gcc -x",
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

table.insert(sh_arguments, shellcheck)
table.insert(sh_arguments, shfmt)
