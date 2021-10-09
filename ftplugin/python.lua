local python_arguments = {}

local flake8 = {
  LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}

local black = { formatCommand = "black --quiet -", formatStdin = true }

local isort = { formatCommand = "isort --quiet --stdout -", formatStdin = true }

local autoimport = { formatCommand = "autoimport  -", formatStdin = true }

local mypy = {
  lintCommand = "mypy",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

table.insert(python_arguments, flake8)
table.insert(python_arguments, autoimport)
table.insert(python_arguments, isort)
table.insert(python_arguments, black)
table.insert(python_arguments, mypy)
