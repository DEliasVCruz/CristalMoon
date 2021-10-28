local M = {}

M.config = function()
  local present1, autopairs = pcall(require, "nvim-autopairs")
  local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
  local present3, rule = pcall(require, "nvim-autopairs.rule")
  local present4, cmp = pcall(require, "cmp")

  if not (present1 or present2 or present3 or present4) then
    return
  end

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

  autopairs.setup {
    check_ts = true,
    map_c_w = true,
    map_bs = false,
    ts_config = {
      lua = { "string" }, -- it will not add pair on that treesitter node
      javascript = { "template_string" },
      java = false, -- don't check treesitter on java
    },
    fast_wrap = {},
  }

  require("nvim-treesitter.configs").setup {
    autopairs = { enable = true },
  }

  local ts_conds = require "nvim-autopairs.ts-conds"

  -- press % => %% is only inside comment or string
  autopairs.add_rules {
    rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  }
end

return M
