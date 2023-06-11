local _general_settings = vim.api.nvim_create_augroup("GeneralSettings", { clear = true })
local settings = {
  ["BufWritePre"] = {
    "*",
    function()
      require("utils.functions").mkdir()
    end,
  },
  ["VimResized"] = {
    "*",
    function()
      vim.cmd 'wincmd ="'
    end,
  },
}

local _formatting = vim.api.nvim_create_augroup("Formatting", { clear = true })
local trim_white = {
  ["BufWritePost"] = {
    "*",
    function()
      -- require("utils.functions").trim_whitespaces()
    end,
  },
}

local _where_am_i = vim.api.nvim_create_augroup("WhereAmI", { clear = true })
local beacon = {
  [{ "WinEnter" }] = {
    "*",
    function()
      require("specs").show_specs()
    end,
  },
}

local _yanking_highlight = vim.api.nvim_create_augroup("YankingHighlight", { clear = true })
local yanking = {
  ["TextYankPost"] = {
    "*",
    function()
      require("vim.highlight").on_yank { higroup = "YankHighlight", timeout = 200 }
    end,
  },
}

require("utils.augroup").create_commands(settings, _general_settings)
require("utils.augroup").create_commands(trim_white, _formatting)
require("utils.augroup").create_commands(yanking, _yanking_highlight)
require("utils.augroup").create_commands(beacon, _where_am_i)
