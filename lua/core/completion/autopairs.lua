local npairs = require "nvim-autopairs"
local Rule = require "nvim-autopairs.rule"

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc "<cr>")
    else
      return npairs.esc "<cr>"
    end
  else
    return npairs.autopairs_cr()
  end
end

if package.loaded["cmp"] then
  require("nvim-autopairs.completion.cmp").setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = { -- modifies the function or method delimiter by filetypes
      all = "(",
      tex = "{",
    },
  }
end

npairs.setup {
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
npairs.add_rules {
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}
