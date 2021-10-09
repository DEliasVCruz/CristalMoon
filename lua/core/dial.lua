local M = {}

M.config = function()
  local dial = require "dial"

  dial.augends["custom#boolean"] = dial.common.enum_cyclic {
    name = "boolean",
    strlist = { "true", "false" },
  }
  table.insert(dial.config.searchlist.normal, "custom#boolean")
  dial.augends["custom#rebase"] = dial.common.enum_cyclic {
    name = "rebase",
    strlist = { "pick", "fixup", "reword", "squash" },
  }
  table.insert(dial.config.searchlist.normal, "custom#rebase")
end

return M
