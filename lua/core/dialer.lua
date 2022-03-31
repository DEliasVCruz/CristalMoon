local M = {}

M.config = function()
  local augend = require "dial.augend"

  require("dial.config").augends:register_group {
    default = {
      augend.integer.alias.decimal_int,
      augend.date.alias["%Y/%m/%d"],
      augend.date.alias["%m/%d/%Y"],
      augend.date.alias["%d/%m/%Y"],
      augend.constant.alias.bool,
      augend.constant.alias.alpha,
      augend.constant.alias.Alpha,
      augend.semver.alias.semver,
      augend.misc.alias.markdown_header,
      augend.constant.new {
        elements = { "and", "or" },
        word = true,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "*", "+" },
        word = false,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "True", "False" },
        word = true,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "&", "|" },
        word = false,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "&&", "||" },
        word = false,
        cyclic = true,
      },
      augend.constant.new {
        elements = { "pick", "fixup", "reword", "squash" },
        word = true,
        cyclic = true,
      },
    },
  }
end

return M
