local funcs = {}

function funcs.trim_whitespaces()
  local save = vim.fn.winsaveview()
  vim.cmd [[keeppatterns %s/\s\+$//e]]
  vim.fn.winrestview(save)
end

function funcs.mkdir()
  local dir = vim.fn.expand "%:p:h"
  if vim.loop.fs_realpath(dir) == nil then
    vim.fn.mkdir(dir, "p")
  end
end

function funcs.search_dotfiles()
  require("telescope.builtin").find_files {
    prompt_title = "< VimRC >",
    cwd = "$HOME/nvim",
  }
end

function funcs.search_notes()
  require("telescope.builtin").find_files {
    prompt_title = "< Notes >",
    cwd = "$HOME/notes",
  }
end

function funcs.jump_behaviour(key)
  local prefix = ""
  if vim.v.count > 2 then
    prefix = "m'" .. vim.v.count
  end
  local suffix = ""
  if vim.v.count > 10 then
    suffix = "<cmd>lua require('specs').show_specs()<cr>"
  end
  return prefix .. key .. suffix
end

-- Toggle colorizer
function funcs.colorizer_toggle()
  local color = require "colorizer"
  if color.is_buffer_attached(0) then
    color.detach_from_buffer(0)
  else
    color.attach_to_buffer(0)
  end
  -- color.reload_all_buffers()
end

-- Needs more configs
function funcs.curbuf()
  local opts = {
    -- winblend = 10,
    border = true,
    previewer = false,
    path_display = { "absolute" },
    layout_strategy = "horizontal",
    skip_empty_lines = true,
    layout_config = {
      height = 20,
      width = 0.40,
      prompt_position = "top",
    },
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function funcs.local_files()
  local opts = {}
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files(opts)
  end
end

function funcs.find_commands()
  local opts = require("telescope.themes").get_ivy()
  require("telescope.builtin").commands(opts)
end

function funcs.misspellings()
  local opts = require("telescope.themes").get_cursor {
    layout_config = {
      height = 12,
      width = 21,
    },
  }
  require("telescope.builtin").spell_suggest(opts)
end

function funcs.find_options()
  local opts = {
    winblend = 10,
    border = true,
    previewer = false,
    path_display = { "absolute" },
    layout_strategy = "horizontal",
    layout_config = {
      height = 20,
      width = 0.40,
    },
  }
  require("telescope.builtin").vim_options(opts)
end

function funcs.lang_select()
  local opts = {
    winblend = 10,
    border = true,
    previewer = false,
    path_display = { "absolute" },
    layout_strategy = "horizontal",
    layout_config = {
      height = 7,
      width = 0.10,
    },
  }
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  pickers.new(opts, {
    prompt_title = "Language",
    finder = finders.new_table {
      results = {
        { "    English", "en_us" },
        { "    Spanish", "es" },
      },
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.opt.spelllang = selection["value"][2]
      end)
      return true
    end,
  }):find()
end

return funcs
