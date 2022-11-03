local M = {}

local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end

local configs = {

  ["neoclip"] = {
    enable_persistent_history = false,
    keys = {
      telescope = {
        i = {
          paste = "<c-y>",
          paste_behind = "<c-b>",
        },
      },
    },
    filter = function(data)
      return not all(data.event.regcontents, is_whitespace)
    end,
  },

  ["better_escape"] = {
    mapping = { "jk" },
    timeout = 200,
    keys = "<esc>l",
  },

  ["neogit"] = {
    disable_hint = true,
    disable_context_highlighting = true,
    integrations = { diffview = true },
    disable_builtin_notifications = true,
    commit_popup = {
      kind = "split",
    },
    kind = "vsplit",
  },

  ["iswap"] = {
    grey = "disable",
    hl_selection = "Comment",
  },

  ["window-picker"] = {
    -- keys = "kjafldsgh",
    swap_shift = false,
    exclude = {
      qf = true,
      ["neo-tree"] = true,
      terminal = true,
      packer = true,
      undotree = true,
      ["lsp-instaler"] = true,
      Trouble = true,
    },
    flash_duration = false,
  },

  ["winshift"] = {
    highlight_moving_win = true, -- Highlight the window being moved
    focused_hl_group = "Visual", -- The highlight group used for the moving window
    moving_win_options = {
      wrap = false,
      cursorline = false,
      cursorcolumn = false,
      colorcolumn = "",
    },
  },

  ["tabout"] = {
    backwards_tabkey = "<C-t>",
  },

  ["mini.surround"] = {
    mappings = {
      add = "", -- Add surrounding
      delete = "", -- Delete surrounding
      find = "", -- Find surrounding (to the right)
      find_left = "", -- Find surrounding (to the left)
      highlight = "", -- Highlight surrounding
      replace = "", -- Replace surrounding
      update_n_lines = "", -- Update `n_lines`
    },
  },

  ["swap-buffers"] = {
    ignore_filetypes = {
      "qf",
      "NvimTree",
      "packer",
      "lsp-installer",
      "undotree",
      "neo-tree",
      "Trouble",
      "terminal",
    },
  },

  ["scrollbar"] = {
    show = true,
    set_highlights = false,
    folds = true,
    handlers = {
      diagnostics = true,
      -- search = true,
    },
    exclude_buftypes = {
      "quickfix",
      "nofile",
      "help",
      "packer",
      "terminal",
      "Trouble",
      "NeogitStatus",
    },
  },

  ["dd"] = {
    timeout = 500,
  },
}

M.config = function(module)
  local ok, plugin = pcall(require, module)
  if not ok then
    return
  end

  if not configs[module] then
    plugin.setup()
  else
    plugin.setup(configs[module])
  end
end

M.rename_conf = function()
  local ok, rename = pcall(require, "renamer")
  if not ok then
    return
  end

  local mappings_utils = require "renamer.mappings.utils"
  rename.setup {
    mappings = {
      ["<c-e>"] = mappings_utils.set_cursor_to_end,
      ["<c-c>"] = function()
        vim.api.nvim_input "<esc>"
      end,
      ["<c-u>"] = mappings_utils.clear_line,
    },
  }
end

M.beam_conf = function()
  local ok, beam = pcall(require, "specs")
  if not ok then
    return
  end

  beam.setup {
    show_jumps = false,
    min_jump = 11,
    popup = {
      delay_ms = 0, -- delay before popup displays
      inc_ms = 15, -- time increments used for fade/resize effects
      blend = 40, -- starting blend, between 0-100 (fully transparent), see :h winblend
      width = 15,
      winhl = "SpecsCursorJump",
      fader = beam.linear_fader,
      resizer = beam.shrink_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
      nofile = true,
    },
  }
end

return M
